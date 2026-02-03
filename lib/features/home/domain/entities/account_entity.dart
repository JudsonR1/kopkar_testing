import 'package:kopkar_testing/features/home/domain/entities/transaction_entity.dart';
import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';

class AccountEntity {
  final String userName;
  final String memberId;
  final double totalBalance;
  final double mandatorySavings; // Simpanan Wajib
  final double voluntarySavings; // Simpanan Sukarela
  final LoanEntity loan;
  final List<TransactionEntity> transactions;

  AccountEntity({
    required this.userName,
    required this.memberId,
    required this.totalBalance,
    required this.mandatorySavings,
    required this.voluntarySavings,
    required this.transactions,
    required this.loan
  });
}