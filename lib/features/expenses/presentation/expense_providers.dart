import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petly/core/providers/core_providers.dart';
import 'package:petly/features/expenses/data/drift_expense_repository.dart';
import 'package:petly/features/expenses/domain/expense.dart';
import 'package:petly/features/expenses/domain/expense_repository.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return DriftExpenseRepository(
    ref.watch(databaseProvider),
    ref.watch(uuidProvider),
  );
});

final expensesByPetProvider =
    StreamProvider.family<List<Expense>, String>((ref, petId) {
  return ref.watch(expenseRepositoryProvider).watchByPet(petId);
});

final allExpensesProvider = StreamProvider<List<Expense>>((ref) {
  return ref.watch(expenseRepositoryProvider).watchAll();
});

final expenseProvider =
    FutureProvider.family<Expense?, String>((ref, id) {
  return ref.watch(expenseRepositoryProvider).getById(id);
});
