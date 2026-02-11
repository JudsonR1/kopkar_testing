import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kopkar_testing/features/auth/data/datasource/auth_datasource.dart';
import 'package:kopkar_testing/features/auth/domain/usecases/login_usecase.dart';
import 'package:kopkar_testing/features/auth/domain/usecases/logout_usecase.dart';
import 'package:kopkar_testing/features/auth/domain/usecases/register_usecase.dart';
import 'package:kopkar_testing/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kopkar_testing/features/auth/presentation/screens/auth_screen.dart';
import 'package:kopkar_testing/features/loan/data/datasource/loan_datasource.dart';
import 'package:kopkar_testing/features/portfolio/data/datasource/portfolio_datasource.dart';
import 'package:kopkar_testing/features/portfolio/data/datasource/savings_datasource.dart';
import 'package:kopkar_testing/features/portfolio/data/repositories_impl/portfolio_repository_impl.dart';
import 'package:kopkar_testing/features/portfolio/data/repositories_impl/savings_repository_impl.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/portoflio_repository.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/savings_repository.dart';

import 'features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/loan/data/repositories_impl/loan_repository_impl.dart';
import 'features/loan/domain/repositories/loan_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_URL'] ?? '',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthDataSource>(create: (_) => AuthDataSource(dio)),
        RepositoryProvider<LoanDataSource>(
          create: (_) => LoanDataSource(),
        ),
        RepositoryProvider<SavingsDataSource>(
          create: (_) => SavingsDataSource(),
        ),
        RepositoryProvider<PortfolioDataSource>(
          create: (_) => PortfolioDataSource(),
        ),
        RepositoryProvider<AuthRepository>(
          lazy: true,
          create:
              (context) => AuthRepositoryImpl(
                authDataSource: context.read<AuthDataSource>(),
              ),
        ),
        RepositoryProvider<LoanRepository>(
          lazy: true,
          create:
              (context) => LoanRepositoryImpl(
                dataSource: context.read<LoanDataSource>(),
              ),
        ),
        RepositoryProvider<SavingsRepository>(
          lazy: true,
          create: (context) => SavingsRepositoryImpl(dataSource: context.read<SavingsDataSource>()),
        ),
        RepositoryProvider<PortfolioRepository>(
          lazy: true,
          create:
              (context) => PortfolioRepositoryImpl(
                dataSource: context.read<PortfolioDataSource>(),
              ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) {
              final authRepo = context.read<AuthRepository>();
              return AuthCubit(
                LoginUseCase(authRepo),
                LogoutUseCase(authRepo),
                RegisterUseCase(authRepo),
              );
            },
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthScreen(),
          initialRoute: '/',
          routes: {},
        ),
      ),
    );
  }
}
