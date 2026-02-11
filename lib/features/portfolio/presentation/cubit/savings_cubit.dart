import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/portfolio/domain/usecase/get_savings_details_usecase.dart';
import '../../domain/repositories/savings_repository.dart';
import 'savings_state.dart';

class SavingsCubit extends Cubit<SavingsState> {
  final GetSavingsDetailsUsecase _getSavingsDetailsUsecase;

  SavingsCubit(this._getSavingsDetailsUsecase) : super(SavingsDetailInitial());

  Future<void> loadSavingsDetails(String type) async {
    emit(SavingsDetailLoading());
    try {
      final data = await _getSavingsDetailsUsecase.call(type);
      emit(SavingsDetailLoaded(data));
    } catch (e) {
      emit(const SavingsDetailError("Failed to load savings details"));
    }
  }
}