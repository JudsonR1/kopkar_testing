import 'package:kopkar_testing/features/home/domain/entities/transaction_entity.dart';

class AccountSummary {
  final String userName;
  final String memberId;
  final double totalBalance;
  final double mandatorySavings; // Simpanan Wajib
  final double voluntarySavings; // Simpanan Sukarela
  final double loanBalance;      
  final double totalLoan;        
  final String loanDueDate;
  final List<TransactionEntity> transactions;

  AccountSummary({
    required this.userName,
    required this.memberId,
    required this.totalBalance,
    required this.mandatorySavings,
    required this.voluntarySavings,
    required this.transactions,
    this.loanBalance=0,      
    this.totalLoan=0,        
    this.loanDueDate='',
  });
}