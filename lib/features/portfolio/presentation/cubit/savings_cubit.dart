import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/savings_repository.dart';
import 'savings_state.dart';

class SavingsCubit extends Cubit<SavingsState> {
  final SavingsRepository repository;

  SavingsCubit(this.repository) : super(SavingsDetailInitial());

  Future<void> loadSavingsDetails(String type) async {
    emit(SavingsDetailLoading());
    try {
      final data = await repository.getSavingsData(type);
      emit(SavingsDetailLoaded(data));
    } catch (e) {
      emit(const SavingsDetailError("Failed to load savings details"));
    }
  }
}