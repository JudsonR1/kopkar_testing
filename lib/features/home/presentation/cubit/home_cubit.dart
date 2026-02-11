import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';
import 'package:kopkar_testing/features/portfolio/domain/usecase/get_portfolio_data_usecase.dart';

import '../../domain/entities/account_entity.dart';
import '../../domain/entities/transaction_entity.dart';
import 'home_state.dart';





class HomeCubit extends Cubit<HomeState> {
    final GetPortfolioDataUseCase _getPortfolioDataUsecase;

  HomeCubit(this._getPortfolioDataUsecase) : super(HomeLoading());

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    try {
          final AccountEntity homeData = await _getPortfolioDataUsecase.call();
      emit(HomeLoaded(homeData));

    } catch (e) {
      emit(const HomeError("Failed to load data"));
    }
  }
}