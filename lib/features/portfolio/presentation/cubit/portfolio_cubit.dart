import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/domain/entities/transaction_entities.dart'; 
import 'portfolio_state.dart';


class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioLoading());

  Future<void> loadPortfolioData() async {
    emit(PortfolioLoading());
    try {
      await Future.delayed(const Duration(seconds: 1)); 

      final data = TransactionEntities(
        userName: "Stella Budiman",
        memberId: "50739",
        totalBalance: 12500000,
        mandatorySavings: 10000000,
        voluntarySavings: 2500000,
        
        totalLoan: 6000000,      
        loanBalance: 3000000,    
        
        loanDueDate: "15 Jun 2025",
        transactions: [],
      );

      emit(PortfolioLoaded(data));
    } catch (e) {
      emit(const PortfolioError("Failed to load portfolio"));
    }
  }
}