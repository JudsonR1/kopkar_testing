import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/loan_repository.dart';
import 'loan_detail_state.dart';

class LoanDetailCubit extends Cubit<LoanDetailState> {
  final LoanRepository loanRepository;

  LoanDetailCubit(this.loanRepository) : super(LoanDetailInitial());

  Future<void> loadLoanDetails() async {
    emit(LoanDetailLoading());
    try {
      final history = await loanRepository.getLoanEntity();
      emit(LoanDetailLoaded(history));
    } catch (e) {
      emit(const LoanDetailError("Failed to load loan details"));
    }
  }
} 