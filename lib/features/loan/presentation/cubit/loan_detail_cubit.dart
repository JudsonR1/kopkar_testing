import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/loan/domain/usecases/get_loan_details_usecase.dart';

import 'loan_detail_state.dart';

class LoanDetailCubit extends Cubit<LoanDetailState> {
  final GetLoanDetailsUsecase _getLoanDetailsUsecase;

  LoanDetailCubit(this._getLoanDetailsUsecase) : super(LoanDetailInitial());

  Future<void> loadLoanDetails() async {
    emit(LoanDetailLoading());
    try {
      final history = await _getLoanDetailsUsecase.call();
      emit(LoanDetailLoaded(history));
    } catch (e) {
      emit(const LoanDetailError("Failed to load loan details"));
    }
  }
} 