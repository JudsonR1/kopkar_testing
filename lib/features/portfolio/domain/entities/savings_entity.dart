import 'package:kopkar_testing/features/home/domain/entities/transaction_entity.dart';


class SavingsEntity{
  final String type;
  final List <TransactionEntity> history;
  final double balance;
  SavingsEntity({
    required this.type,
    required this.history,
    required this.balance,
  });
}