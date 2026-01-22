

class TransactionModel {
  final String type;
  final String title;
  final String date;
  final double amount;
  final bool isIncome; // true = Green, false = Black
  TransactionModel(this.type,this.title, this.date, this.amount, this.isIncome);
}