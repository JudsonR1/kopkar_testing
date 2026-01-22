import 'package:kopkar_testing/features/home/data/model/transaction_model.dart';

class TransactionEntities {
  final String userName;
  final String memberId;
  final double totalBalance;
  final double mandatorySavings; // Simpanan Wajib
  final double voluntarySavings; // Simpanan Sukarela
  final List<TransactionModel> transactions;

  TransactionEntities({
    required this.userName,
    required this.memberId,
    required this.totalBalance,
    required this.mandatorySavings,
    required this.voluntarySavings,
    required this.transactions,
  });
}