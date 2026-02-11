import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/domain/entities/account_entity.dart';
import '../../domain/usecase/get_portfolio_data_usecase.dart';
import 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final GetPortfolioDataUseCase _getPortfolioDataUsecase;

  PortfolioCubit(this._getPortfolioDataUsecase) : super(PortfolioLoading());

  Future<void> loadPortfolioData() async {
    emit(PortfolioLoading());
    try {
      final AccountEntity data = await _getPortfolioDataUsecase.call();
      emit(PortfolioLoaded(data));
    } catch (_) {
      emit(const PortfolioError("Failed to load portfolio"));
    }
  }
}
