import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';
import 'package:kopkar_testing/features/loan/domain/repositories/loan_repository.dart';
import '../../../home/domain/entities/account_summary.dart';
import 'portfolio_state.dart';


class PortfolioCubit extends Cubit<PortfolioState> {
  final LoanRepository loanRepository;
  PortfolioCubit(this.loanRepository) : super(PortfolioLoading());
  
  Future<void> loadPortfolioData() async {
    emit(PortfolioLoading());
    try {
      await Future.delayed(const Duration(seconds: 1)); 
      final history = await loanRepository.getLoanEntity();
      final data = AccountSummary(
        userName: "Stella Budiman",
        memberId: "50739",
        totalBalance: 12500000,
        mandatorySavings: 10000000,
        voluntarySavings: 2500000,
        loan: history,
        transactions: [],
      );

      emit(PortfolioLoaded(data));
    } catch (e) {
      emit(const PortfolioError("Failed to load portfolio"));
    }
  }
}