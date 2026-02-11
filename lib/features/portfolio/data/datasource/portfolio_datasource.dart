import 'package:kopkar_testing/features/home/domain/entities/transaction_entity.dart';
import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';
import '../../../home/domain/entities/account_entity.dart';

class PortfolioDataSource {
  Future<AccountEntity> getPortfolioData() async {
    await Future.delayed(const Duration(seconds: 1));

    return AccountEntity(
      userName: "Stella Budiman",
      memberId: "50739",
      totalBalance: 12500000,
      mandatorySavings: 10000000,
      voluntarySavings: 2500000,
      loan: null,
      transactions: [
        TransactionEntity("Withdrawal","Penarikan Dana", "02 Jun 2025, 09.15", 150000, false),
        TransactionEntity("Deposit","Setoran Dana", "02 Jun 2025, 09.15", 200000, true),
        TransactionEntity("Transaction","Indomaret Kopkar", "02 Jun 2025, 09.15", 75000, false),
        TransactionEntity("Interest","SHU", "02 Jun 2025, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jun 2025, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 May 2025, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 April 2025, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jan 2026, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jan 2026, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jan 2026, 09.15", 500000, false),
        TransactionEntity("TESTING","Testing", "02 Jun 2025, 09.15", 500000, false),],
    );
  }
}
