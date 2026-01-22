import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/transaction_model.dart'; // Import your models
// Import your entities file (adjust path as needed)
import '../../domain/entities/transaction_entities.dart';
import 'home_state.dart';





class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));

      // 1. Create the Transaction List
      final transactions = [
        TransactionModel("Withdrawal","Penarikan Dana", "02 Jun 2025, 09.15", 150000, false),
        TransactionModel("Deposit","Setoran Dana", "02 Jun 2025, 09.15", 200000, true),
        TransactionModel("Transaction","Indomaret Kopkar", "02 Jun 2025, 09.15", 75000, false),
        TransactionModel("Interest","SHU", "02 Jun 2025, 09.15", 500000, false),
        TransactionModel("TESTING","Testing", "02 Jun 2025, 09.15", 500000, false),
      ];

      // 2. Create the Entity Object
      final homeData = TransactionEntities(
        userName: "Stella Budiman",
        memberId: "50739",
        totalBalance: 12500000,
        mandatorySavings: 10000000,
        voluntarySavings: 2500000,
        transactions: transactions,
      );

      // 3. Emit the Entity inside the State
      emit(HomeLoaded(homeData));

    } catch (e) {
      emit(const HomeError("Failed to load data"));
    }
  }
}