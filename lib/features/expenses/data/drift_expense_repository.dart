import 'package:drift/drift.dart';
import 'package:petly/core/database/app_database.dart';
import 'package:petly/features/expenses/domain/expense.dart' as domain;
import 'package:petly/features/expenses/domain/expense_repository.dart';
import 'package:uuid/uuid.dart';

class DriftExpenseRepository implements ExpenseRepository {
  DriftExpenseRepository(this._db, this._uuid);
  final AppDatabase _db;
  final Uuid _uuid;

  @override
  Stream<List<domain.Expense>> watchByPet(String petId) {
    final q = _db.select(_db.expenses)
      ..where((r) => r.petId.equals(petId))
      ..orderBy([(r) => OrderingTerm.desc(r.occurredOn)]);
    return q.watch().map((rows) => rows.map(_map).toList());
  }

  @override
  Stream<List<domain.Expense>> watchAll() {
    final q = _db.select(_db.expenses)
      ..orderBy([(r) => OrderingTerm.desc(r.occurredOn)]);
    return q.watch().map((rows) => rows.map(_map).toList());
  }

  @override
  Future<domain.Expense?> getById(String id) async {
    final row = await (_db.select(_db.expenses)
          ..where((r) => r.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _map(row);
  }

  @override
  Future<void> save({
    String? id,
    String? petId,
    required String category,
    required int amountMinor,
    required String currencyCode,
    required DateTime occurredOn,
    String? merchant,
    String? paymentMethod,
    String? notes,
  }) async {
    final existing = id == null
        ? null
        : await (_db.select(_db.expenses)..where((r) => r.id.equals(id)))
            .getSingleOrNull();
    final now = DateTime.now().toUtc();
    await _db.into(_db.expenses).insertOnConflictUpdate(
          ExpensesCompanion.insert(
            id: id ?? _uuid.v4(),
            petId: Value(petId),
            category: category,
            amountMinor: amountMinor,
            currencyCode: currencyCode,
            occurredOn: occurredOn,
            merchant: Value(_c(merchant)),
            paymentMethod: Value(_c(paymentMethod)),
            notes: Value(_c(notes)),
            createdAt: Value(existing?.createdAt ?? now),
            updatedAt: Value(now),
          ),
        );
  }

  @override
  Future<void> delete(String id) =>
      (_db.delete(_db.expenses)..where((r) => r.id.equals(id))).go();

  domain.Expense _map(Expense r) => domain.Expense(
        id: r.id,
        petId: r.petId,
        category: r.category,
        amountMinor: r.amountMinor,
        currencyCode: r.currencyCode,
        occurredOn: r.occurredOn,
        merchant: r.merchant,
        paymentMethod: r.paymentMethod,
        notes: r.notes,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
      );

  String? _c(String? v) {
    final s = v?.trim();
    return (s == null || s.isEmpty) ? null : s;
  }
}
