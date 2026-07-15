import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/app/theme/app_theme.dart';
import 'package:petly/core/extensions/extensions.dart';
import 'package:petly/core/utils/dialog_utils.dart';
import 'package:petly/core/widgets/shared_widgets.dart';
import 'package:petly/features/expenses/domain/expense.dart';
import 'package:petly/features/expenses/presentation/expense_providers.dart';

class ExpenseFormScreen extends ConsumerStatefulWidget {
  const ExpenseFormScreen({required this.petId, this.expenseId, super.key});
  final String petId;
  final String? expenseId;

  @override
  ConsumerState<ExpenseFormScreen> createState() => _State();
}

class _State extends ConsumerState<ExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _merchantCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  DateTime _occurredOn = DateTime.now();
  String _category = 'Veterinary';
  String _currency = 'INR';
  String? _paymentMethod;
  bool _saving = false;
  bool _loaded = false;

  @override
  void dispose() {
    _amountCtrl.dispose();
    _merchantCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  void _load(Expense e) {
    if (_loaded) return;
    _loaded = true;
    _amountCtrl.text = (e.amountMinor / 100.0).toStringAsFixed(2);
    _merchantCtrl.text = e.merchant ?? '';
    _notesCtrl.text = e.notes ?? '';
    _occurredOn = e.occurredOn;
    _category = e.category;
    _currency = e.currencyCode;
    _paymentMethod = e.paymentMethod;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final amount = double.parse(_amountCtrl.text.replaceAll(',', '.'));
      final minor = (amount * 100).round();
      await ref.read(expenseRepositoryProvider).save(
            id: widget.expenseId,
            petId: widget.petId,
            category: _category,
            amountMinor: minor,
            currencyCode: _currency,
            occurredOn: _occurredOn,
            merchant: _merchantCtrl.text.nullIfEmpty,
            paymentMethod: _paymentMethod,
            notes: _notesCtrl.text.nullIfEmpty,
          );
      if (mounted) context.pop();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Could not save expense.')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.expenseId != null;
    if (isEdit) {
      ref.watch(expenseProvider(widget.expenseId!)).whenData((v) {
        if (v != null) _load(v);
      });
    }

    return LoadingOverlay(
      isLoading: _saving,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? 'Edit expense' : 'Add expense'),
          actions: [
            if (isEdit)
              IconButton(
                icon: const Icon(Icons.delete_outline_rounded),
                onPressed: () => _delete(context),
              ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
            children: [
              // Category
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  prefixIcon: Icon(Icons.category_outlined),
                ),
                items: Expense.categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() => _category = v!),
              ),
              const SizedBox(height: 14),

              // Amount + currency
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _amountCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Amount *',
                        prefixIcon: Icon(Icons.payments_outlined),
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Required';
                        if (double.tryParse(v.replaceAll(',', '.')) == null) return 'Invalid';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 100,
                    child: DropdownButtonFormField<String>(
                      value: _currency,
                      decoration: const InputDecoration(labelText: 'Currency'),
                      items: const [
                        DropdownMenuItem(value: 'INR', child: Text('₹ INR')),
                        DropdownMenuItem(value: 'USD', child: Text('\$ USD')),
                        DropdownMenuItem(value: 'EUR', child: Text('€ EUR')),
                        DropdownMenuItem(value: 'GBP', child: Text('£ GBP')),
                      ],
                      onChanged: (v) => setState(() => _currency = v!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Date
              InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () async {
                  final r = await showDatePicker(
                    context: context,
                    initialDate: _occurredOn,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (r != null) setState(() => _occurredOn = r);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    prefixIcon: Icon(Icons.calendar_today_rounded),
                    suffixIcon: Icon(Icons.edit_calendar_outlined, size: 18),
                  ),
                  child: Text(_occurredOn.toDisplayDate()),
                ),
              ),
              const SizedBox(height: 14),

              TextFormField(
                controller: _merchantCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Merchant / payee (optional)',
                  prefixIcon: Icon(Icons.store_outlined),
                ),
              ),
              const SizedBox(height: 14),

              DropdownButtonFormField<String?>(
                value: _paymentMethod,
                decoration: const InputDecoration(
                  labelText: 'Payment method (optional)',
                  prefixIcon: Icon(Icons.credit_card_outlined),
                ),
                items: const [
                  DropdownMenuItem(value: null, child: Text('Not specified')),
                  DropdownMenuItem(value: 'Cash', child: Text('Cash')),
                  DropdownMenuItem(value: 'Card', child: Text('Card')),
                  DropdownMenuItem(value: 'UPI', child: Text('UPI')),
                  DropdownMenuItem(value: 'Net Banking', child: Text('Net Banking')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                onChanged: (v) => setState(() => _paymentMethod = v),
              ),
              const SizedBox(height: 14),

              TextFormField(
                controller: _notesCtrl,
                minLines: 2,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Notes (optional)',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.notes_rounded),
                ),
              ),
              const SizedBox(height: 28),
              FilledButton(
                onPressed: _saving ? null : _save,
                style: FilledButton.styleFrom(backgroundColor: AppTheme.expenseColor),
                child: Text(isEdit ? 'Save changes' : 'Add expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _delete(BuildContext ctx) async {
    final ok = await showDeleteConfirmationDialog(ctx, itemType: 'expense');
    if (ok != true || !mounted) return;
    await ref.read(expenseRepositoryProvider).delete(widget.expenseId!);
    if (mounted) context.pop();
  }
}
