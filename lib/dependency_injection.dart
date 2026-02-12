import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:kopkar_testing/features/auth/data/datasource/auth_datasource.dart';
import 'package:kopkar_testing/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:kopkar_testing/features/auth/domain/repositories/auth_repository.dart';
import 'package:kopkar_testing/features/auth/domain/usecases/login_usecase.dart';
import 'package:kopkar_testing/features/auth/domain/usecases/logout_usecase.dart';
import 'package:kopkar_testing/features/auth/domain/usecases/register_usecase.dart';
import 'package:kopkar_testing/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kopkar_testing/features/forms/presentation/cubit/form_list_cubit.dart';
import 'package:kopkar_testing/features/home/presentation/cubit/home_cubit.dart';
import 'package:kopkar_testing/features/loan/data/datasource/loan_datasource.dart';
import 'package:kopkar_testing/features/loan/data/repositories_impl/loan_repository_impl.dart';
import 'package:kopkar_testing/features/loan/domain/repositories/loan_repository.dart';
import 'package:kopkar_testing/features/loan/domain/usecases/get_loan_details_usecase.dart';
import 'package:kopkar_testing/features/loan/presentation/cubit/loan_detail_cubit.dart';
import 'package:kopkar_testing/features/portfolio/data/datasource/portfolio_datasource.dart';
import 'package:kopkar_testing/features/portfolio/data/datasource/savings_datasource.dart';
import 'package:kopkar_testing/features/portfolio/data/repositories_impl/portfolio_repository_impl.dart';
import 'package:kopkar_testing/features/portfolio/data/repositories_impl/savings_repository_impl.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/portoflio_repository.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/savings_repository.dart';
import 'package:kopkar_testing/features/portfolio/domain/usecase/get_portfolio_data_usecase.dart';
import 'package:kopkar_testing/features/portfolio/domain/usecase/get_savings_details_usecase.dart';
import 'package:kopkar_testing/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:kopkar_testing/features/portfolio/presentation/cubit/savings_cubit.dart';

class DependencyInjection {
  DependencyInjection._();

  static final DependencyInjection instance = DependencyInjection._();

  static DependencyInjection get getInstance => instance;

  final getIt = GetIt.instance;

  void setupDI(){
getIt.registerLazySingleton<Dio>(
  () => Dio(
    BaseOptions(  
      baseUrl: dotenv.env['API_URL']!,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  ),
);

    // Auth Feature
    getIt.registerLazySingleton<AuthDatasource>(
      () => AuthDataSourceImpl(getIt<Dio>())
    );

       getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authDataSource: getIt<AuthDatasource>(),
      ),
    );

        getIt.registerLazySingleton(
      () => LoginUseCase(getIt<AuthRepository>()),
    );

    getIt.registerLazySingleton(
      () => LogoutUseCase(getIt<AuthRepository>()),
    );

    getIt.registerLazySingleton(
      () => RegisterUseCase(getIt<AuthRepository>()),
    );

      
        getIt.registerFactory(
      () => AuthCubit(
        getIt<LoginUseCase>(),
        getIt<LogoutUseCase>(),
        getIt<RegisterUseCase>(),
      ),
    );

    // Home feature
          getIt.registerFactory(
      () => HomeCubit(
        getIt<GetPortfolioDataUseCase>(),
      ),
    );


    // Loan feature
      getIt.registerLazySingleton<LoanDataSource>(
      () => LoanDataSource(),
    );

    getIt.registerLazySingleton<LoanRepository>(
      () => LoanRepositoryImpl(
        dataSource: getIt<LoanDataSource>(),
      ),
    );
        getIt.registerLazySingleton(
      () => GetLoanDetailsUsecase(getIt<LoanRepository>()),
    );

    getIt.registerFactory(
      () => LoanDetailCubit(
        getIt<GetLoanDetailsUsecase>(),
      ),
    );
    // Savings Feature
        getIt.registerLazySingleton<SavingsDataSource>(
      () => SavingsDataSource(),
    );

    getIt.registerLazySingleton<SavingsRepository>(
      () => SavingsRepositoryImpl(
        dataSource: getIt<SavingsDataSource>(),
      ),
    );
    
        getIt.registerLazySingleton(
      () => GetSavingsDetailsUsecase(getIt<SavingsRepository>()),
    );

       getIt.registerFactory(
      () => SavingsCubit(
        getIt<GetSavingsDetailsUsecase>(),
      ),
    );


      // Portfolio feature
        getIt.registerLazySingleton<PortfolioDataSource>(
      () => PortfolioDataSource(),
    );
    getIt.registerLazySingleton<PortfolioRepository>(
      () => PortfolioRepositoryImpl(
        dataSource: getIt<PortfolioDataSource>(),
      ),
    );

        getIt.registerLazySingleton(
      () => GetPortfolioDataUseCase(getIt<PortfolioRepository>(),getIt<LoanRepository>()),
    );
       getIt.registerFactory(
      () => PortfolioCubit(
        getIt<GetPortfolioDataUseCase>(),
      ),
    );

      // Forms feature
      getIt.registerFactory<FormListCubit>(() => FormListCubit(),
);
  }
}
