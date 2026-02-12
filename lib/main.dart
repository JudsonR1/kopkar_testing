import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:kopkar_testing/dependency_injection.dart';
import 'package:kopkar_testing/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kopkar_testing/features/auth/presentation/screens/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  DependencyInjection.getInstance.setupDI();
  print(GetIt.instance.isRegistered<AuthCubit>());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sl = DependencyInjection.getInstance.getIt;

    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
      ),
    );
  }
}
