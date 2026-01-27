import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/account_summary.dart';
import 'home_state.dart';





class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));

      final transactions = [
        TransactionEntity("Withdrawal","Penarikan Dana", "02 Jun 2025, 09.15", 150000, false),
        TransactionEntity("Deposit","Setoran Dana", "02 Jun 2025, 09.15", 200000, true),
        TransactionEntity("Transaction","Indomaret Kopkar", "02 Jun 2025, 09.15", 75000, false),
        TransactionEntity("Interest","SHU", "02 Jun 2025, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jun 2025, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 May 2025, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 April 2025, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jan 2026, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jan 2026, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jan 2026, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jun 2025, 09.15", 500000, false),
      ];

      final homeData = AccountSummary(
        userName: "Stella Budiman",
        memberId: "50739",
        totalBalance: 12500000,
        mandatorySavings: 10000000,
        voluntarySavings: 2500000,
        transactions: transactions,
      );

      emit(HomeLoaded(homeData));

    } catch (e) {
      emit(const HomeError("Failed to load data"));
    }
  }
}