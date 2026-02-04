import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/home/presentation/widgets/transaction_list.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/savings_repository.dart';
import 'package:kopkar_testing/features/portfolio/presentation/cubit/savings_cubit.dart';
import 'package:kopkar_testing/features/portfolio/presentation/cubit/savings_state.dart';
import 'package:kopkar_testing/features/portfolio/presentation/widgets/savings/savings_header.dart';



class VoluntarySavingsScreen extends StatelessWidget {
  const VoluntarySavingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavingsCubit(
        context.read<SavingsRepository>(), 
      )..loadSavingsDetails('sukarela'),
      child: const _VoluntaryView(),
    );
  }
}

class _VoluntaryView extends StatelessWidget {
  const _VoluntaryView();

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
        title: const Text("Simpanan Sukarela", 
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
                        icon: Icons.account_balance_wallet,
                        iconBGColor: const Color(0xFF0D47A1),
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