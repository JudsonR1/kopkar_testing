import 'package:flutter/material.dart';
import 'package:kopkar_testing/features/home/domain/entities/transaction_entity.dart';


class SavingsHistoryList extends StatelessWidget {
  final List<TransactionEntity> history;

  const SavingsHistoryList({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("History", 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 20),
          
          _buildMonthHeader(),
          const Divider(height: 30),
          
          ...history.map((entity) => _buildHistoryItem(entity)),
        ],
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Jun 2025", 
          style: TextStyle(color: Colors.blueGrey, fontSize: 14)
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text("Outgoing: Rp 175.000", style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text("Incoming: Rp 600.000", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }

  Widget _buildHistoryItem(TransactionEntity entity) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6F9),
              shape: BoxShape.circle,
            ),
            child: Icon(
              entity.isIncome ? Icons.arrow_downward : Icons.arrow_upward,
              color: const Color(0xFF0D47A1),
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entity.title, 
                  style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w600)
                ),
                Text(entity.date, 
                  style: const TextStyle(color: Colors.grey, fontSize: 12)
                ),
              ],
            ),
          ),
          Text(
            "${entity.isIncome ? '+' : '-'}Rp ${_formatCurrency(entity.amount)}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: entity.isIncome ? Colors.green : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }
}