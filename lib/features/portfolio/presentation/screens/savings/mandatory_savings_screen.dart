import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/dependency_injection.dart';
import 'package:kopkar_testing/features/home/presentation/widgets/transaction_list.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/savings_repository.dart';
import 'package:kopkar_testing/features/portfolio/domain/usecase/get_savings_details_usecase.dart';
import 'package:kopkar_testing/features/portfolio/presentation/cubit/savings_cubit.dart';
import 'package:kopkar_testing/features/portfolio/presentation/cubit/savings_state.dart';
import 'package:kopkar_testing/features/portfolio/presentation/widgets/savings/savings_header.dart';



class MandatorySavingsScreen extends StatelessWidget {
  const MandatorySavingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final sl = DependencyInjection.getInstance.getIt;

    return BlocProvider(
      create: (_) => sl<SavingsCubit>()..loadSavingsDetails('wajib'),
      child: const _MandatoryView(),
    );
  }
}

class _MandatoryView extends StatelessWidget {
  const _MandatoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF5F6F9),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Simpanan Wajib", 
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
          child: BlocBuilder<SavingsCubit, SavingsState>(
            builder: (context, state) {
              if (state is SavingsDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SavingsDetailLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SavingsHeader(
                        balance: state.data.balance,
                        icon: Icons.receipt_long,
                        iconBGImage:  const AssetImage('assets/portfolio_page/simpanan_wajib_bg.png'),
                      ),
                       Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                         child: Column(
                           children: [
                             SizedBox(
                               height: 50,
                               width: double.infinity,
                               child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Align(
                                 alignment: Alignment.centerLeft,
                                 child: Text(
                                   "History",
                                   style: TextStyle(fontSize: 20),
                                 ),
                               ),)
                             ),
                                               SizedBox(height: 5,),
                                               TransactionList(transactions: state.data.history),
                           ],
                         ),
                       ),
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