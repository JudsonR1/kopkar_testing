import 'package:kopkar_testing/features/home/domain/entities/transaction_entity.dart';
import 'package:kopkar_testing/features/portfolio/domain/entities/savings_entity.dart';
import 'package:kopkar_testing/features/portfolio/domain/repositories/savings_repository.dart';
class SavingsRepositoryImpl implements SavingsRepository{
@override
 Future<SavingsEntity> getSavingsData(String type) async{
  if(type.toLowerCase().contains('sukarela')){

  return SavingsEntity(
    type: "sukarela", 
    history:  [  TransactionEntity(
            "Withdrawal","Penarikan Dana","02 Jun 2025, 09.15",150000,false
          ),TransactionEntity( "Deposit","Setoran Dana", "25 May 2025, 09.15", 200000, true,
          ),
          TransactionEntity( "Deposit","Setoran Dana","25 Apr 2025, 09.15",200000,true,
          ),
    ], 
  balance: 2500000
  );
 } else if(type.toLowerCase().contains('wajib')){
  return SavingsEntity(
    type: "wajib",
  balance: 10500000,
  history: [
    TransactionEntity(
      "interest",
      "SHU Tahun 2024",
      "02 Jun 2025, 09.15",
      500000,
      true,
    ),
    TransactionEntity(
      "interest",
      "SHU Tahun 2024",
      "02 Jun 2025, 09.15",
      500000,
      true,
    ),
    TransactionEntity(
      "interest",
      "SHU Tahun 2024",
      "02 Jun 2025, 09.15",
      500000,
      true,
    ),
    TransactionEntity(
      "interest",
      "SHU Tahun 2024",
      "02 Jun 2025, 09.15",
      500000,
      true,
    ),
    TransactionEntity(
      "interest",
      "SHU Tahun 2024",
      "02 Jun 2025, 09.15",
      500000,
      true,
    ),
    TransactionEntity(
      "interest",
      "SHU Tahun 2024",
      "02 Jun 2025, 09.15",
      500000,
      true,
    ),
    TransactionEntity(
      "interest",
      "SHU Tahun 2024",
      "02 Jun 2025, 09.15",
      500000,
      true,
    ),
    TransactionEntity(
      "interest",
      "SHU Tahun 2024",
      "02 Jun 2025, 09.15",
      500000,
      true,
    ),
    TransactionEntity(
      "interest",
      "SHU Tahun 2024",
      "02 Jun 2025, 09.15",
      500000,
      true,
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
  ],
);

 }
   throw Exception("Invalid savings type");
  }
}