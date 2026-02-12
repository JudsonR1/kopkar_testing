import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/dependency_injection.dart';
import 'package:kopkar_testing/features/loan/domain/repositories/loan_repository.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/portoflio_repository.dart';
import 'package:kopkar_testing/features/portfolio/domain/usecase/get_portfolio_data_usecase.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/balance_card.dart';
import '../widgets/home_header.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final sl = DependencyInjection.getInstance.getIt;

    return BlocProvider(
      create: (_) => sl<HomeCubit>()..loadHomeData(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [

                  Container(
                     padding: const EdgeInsets.only(bottom: 24),
                      decoration: const BoxDecoration(
     image: DecorationImage(
      image: AssetImage('assets/home_page/header_bg.png'),
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(24), 
      bottomRight: Radius.circular(24),
    ),
  ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: HomeHeader(
                            userName: state.data.userName,
                            memberId: state.data.memberId,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: BalanceCard(
                            totalBalance: state.data.totalBalance,
                            mandatory: state.data.mandatorySavings,
                            voluntary: state.data.voluntarySavings,
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  SizedBox(
  height: 50,
  width: double.infinity,
  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "Riwayat Transaksi",
      style: TextStyle(fontSize: 20),
    ),
  ),)
),
 SizedBox(
                    height: 5,
                  ),

                  TransactionList(
                    transactions: state.data.transactions,
                  ),
                ],
              ),
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
