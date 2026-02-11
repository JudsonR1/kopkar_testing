import 'package:kopkar_testing/features/home/domain/entities/transaction_entity.dart';
import 'package:kopkar_testing/features/portfolio/domain/entities/savings_entity.dart';

class SavingsDataSource {
  Future<SavingsEntity> getSavingsData(String type) async {
    final lowerType = type.toLowerCase();

    if (lowerType.contains('sukarela')) {
      return SavingsEntity(
        type: "sukarela",
        balance: 2500000,
        history: [
          TransactionEntity(
            "Withdrawal",
            "Penarikan Dana",
            "02 Jun 2025, 09.15",
            150000,
            false,
          ),
          TransactionEntity(
            "Deposit",
            "Setoran Dana",
            "25 May 2025, 09.15",
            200000,
            true,
          ),
          TransactionEntity(
            "Deposit",
            "Setoran Dana",
            "25 Apr 2025, 09.15",
            200000,
            true,
          ),
          TransactionEntity(
            "Deposit",
            "Setoran Dana",
            "25 Apr 2025, 09.15",
            200000,
            true,
          ),
          TransactionEntity(
            "Deposit",
            "Setoran Dana",
            "25 Apr 2025, 09.15",
            200000,
            true,
          ),
          TransactionEntity(
            "Deposit",
            "Setoran Dana",
            "25 Apr 2025, 09.15",
            200000,
            true,
          ),
          TransactionEntity(
            "Deposit",
            "Setoran Dana",
            "25 Apr 2025, 09.15",
            200000,
            true,
          ),
          TransactionEntity(
            "Deposit",
            "Setoran Dana",
            "25 Apr 2025, 09.15",
            200000,
            true,
          ),
        ],
      );
    }

    if (lowerType.contains('wajib')) {
      return SavingsEntity(
        type: "wajib",
        balance: 10500000,
        history: [
          ...List.generate(
            9,
            (_) => TransactionEntity(
              "interest",
              "SHU Tahun 2024",
              "02 Jun 2025, 09.15",
              500000,
              true,
            ),
          ),
          TransactionEntity(
            "transaction",
            "Indomaret Kopkar",
            "25 May 2025, 09.15",
            150000,
            false,
          ),
          TransactionEntity(
            "withdraw",
            "Penarikan Dana",
            "25 Apr 2025, 09.15",
            150000,
            true,
          ),
          TransactionEntity(
            "withdraw",
            "Penarikan Dana",
            "25 Apr 2025, 09.15",
            150000,
            true,
          ),
          TransactionEntity(
            "withdraw",
            "Penarikan Dana",
            "25 Apr 2025, 09.15",
            150000,
            true,
          ),
          TransactionEntity(
            "withdraw",
            "Penarikan Dana",
            "25 Apr 2025, 09.15",
            150000,
            true,
          ),
        ],
      );
    }

    throw Exception("Invalid savings type");
  }
}
