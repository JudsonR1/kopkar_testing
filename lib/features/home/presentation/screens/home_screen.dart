import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/balance_card.dart';
import '../widgets/home_header.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadHomeData(),
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
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60),
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
                   SizedBox(
                    height: 50,
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
