import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/portfolio/presentation/cubit/portfolio_state.dart';

import '../cubit/portfolio_cubit.dart';
import '../widgets/loan_card.dart';
import '../widgets/portfolio_card.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PortfolioCubit()..loadPortfolioData(),
      child: const PortfolioView(),
    );
  }
}

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Portofolio",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: BlocBuilder<PortfolioCubit, PortfolioState>(
        builder: (context, state) {
          if (state is PortfolioLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PortfolioLoaded) {
            final data = state.data;
            final double loanPercentage = (data.loanBalance / data.totalLoan).clamp(0.0, 1.0);
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Total Balance Bar
                  Container(
                    color: Colors.grey.shade50,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Saldo", style: TextStyle(color: Colors.blueGrey.shade700, fontSize: 16)),
                        Text(
                          "Rp ${_formatCurrency(data.totalBalance)}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  //3. loan card
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // 1. Simpanan Wajib (White Card)
                        PortfolioCard(
                          title: "Simpanan Wajib",
                          amount: data.mandatorySavings,
                          icon: Icons.receipt_long,
                          iconBackgroundImage: const AssetImage('assets/portfolio_page/simpanan_wajib_bg.png'),
                          onDetailTap: () {
                             // Handle Navigation Here
                             print("Navigate to Simpanan Wajib Detail");
                             // Example: Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
                          },
                        ),

                        // 2. Simpanan Sukarela (Blue Card)
                        PortfolioCard(
                          title: "Simpanan Sukarela",
                          amount: data.voluntarySavings,
                          icon: Icons.account_balance_wallet,
                          backgroundColor: const Color(0xFF000080), // Dark Blue
                          textColor: Colors.white,
                          iconBackgroundColor: const Color.fromARGB(0, 255, 255, 255),
                          onDetailTap: () {
                             print("Navigate to Simpanan Sukarela Detail");
                          },
                        ),
                      ],
                    ),
                  ),
                  //3. Sisa Pinjaman (Red Card)
                           Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [

                        LoanCard(
                          amount: data.loanBalance,   // Menampilkan Rp 3.000.000
                          date: data.loanDueDate,
                          progress: loanPercentage,   // Mengirim 0.5 (50%)
                          onDetailTap: () {
                             print("Navigate to Pinjaman Detail");
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          } else if (state is PortfolioError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }
}