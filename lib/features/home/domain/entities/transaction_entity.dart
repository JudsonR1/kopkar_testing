

class TransactionEntity {
  final String type;
  final String title;
  final String date;
  final double amount;
  final bool isIncome; // true = Green, false = Black
  TransactionEntity(this.type,this.title, this.date, this.amount, this.isIncome);
}