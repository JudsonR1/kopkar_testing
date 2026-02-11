import '../../domain/entities/loan_entity.dart';
import '../../domain/entities/loan_payment.dart';

class LoanDataSource {
  Future<LoanEntity> getLoanData() async {
    await Future.delayed(const Duration(seconds: 1));

    final baseDate = DateTime(2025, 5, 25);
    const int count = 12;

    return LoanEntity(
      totalLoan: 6000000,
      loanBalance: 3000000,
      loanDueDate: "15 Jun 2025",
      paymentHistory: List.generate(count, (index) {
        final currentDate =
            DateTime(baseDate.year, baseDate.month + index, baseDate.day);

        final bool isPaid = index < 6;

        return LoanPayment(
          title: "Cicilan ${index + 1} dari $count",
          date: _formatDate(currentDate),
          amount: 500000,
          isPaid: isPaid,
        );
      }),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return "${date.day} ${months[date.month - 1]} ${date.year}, 09.15";
  }
}
