import 'package:petly/features/expenses/domain/expense.dart';

abstract interface class ExpenseRepository {
  Stream<List<Expense>> watchByPet(String petId);
  Stream<List<Expense>> watchAll();
  Future<Expense?> getById(String id);
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
  });
  Future<void> delete(String id);
}
