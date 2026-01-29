import 'package:kopkar_testing/features/loan/domain/entities/loan_payment.dart';

class LoanEntity {
  final double loanBalance;      
  final double totalLoan;        
  final String loanDueDate;
  final List<LoanPayment> paymentHistory;  

  int get paidCount{
    return paymentHistory.where((payment) => payment.isPaid).length;
  }

  LoanEntity({
    this.loanBalance=0,      
    this.totalLoan=0,        
    this.loanDueDate='',
    this.paymentHistory = const [],
    
  });
}