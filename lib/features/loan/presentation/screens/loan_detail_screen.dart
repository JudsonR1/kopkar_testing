import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/loan/domain/usecases/get_loan_details_usecase.dart';
import 'package:kopkar_testing/features/loan/presentation/screens/loan_simulation_screen.dart';

import '../../domain/repositories/loan_repository.dart';
import '../cubit/loan_detail_cubit.dart';
import '../cubit/loan_detail_state.dart';
import '../widgets/loan_header.dart';
import '../widgets/loan_payment_list.dart';

class LoanDetailScreen extends StatelessWidget {
  const LoanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoanDetailCubit(
        GetLoanDetailsUsecase(context.read<LoanRepository>()),
      )..loadLoanDetails(),
      child: const LoanDetailView(),
    );
  }
}

class LoanDetailView extends StatelessWidget {
  const LoanDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Pinjaman", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
        ),
        centerTitle: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,       // top
          Color.fromRGBO(192, 204, 255, 1),  // bottom
        ],
      ),
    ),
        child: SafeArea(
          child: BlocBuilder<LoanDetailCubit, LoanDetailState>(
            builder: (context, state) {
              if (state is LoanDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoanDetailLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      LoanHeader(loans: state.history, onTap: () {
                             print("Navigate to Simulasi Pinjaman");
                             Navigator.of(context,rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (_) => const LoanSimulationScreen(),
                              ),
                            );
                          },),
                      LoanPaymentList(loans: state.history),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}