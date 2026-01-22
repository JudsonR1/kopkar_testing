import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/model/transaction_model.dart';


class TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Loop through the list with an index
        for (int i = 0; i < transactions.length; i++) ...[
          _buildItem(transactions[i]),
          
          // Only add a Divider if this is NOT the last item
          if (i != transactions.length - 1)
            Divider(
              height: 1,            // Height of the divider widget space
              thickness: 1,       // Thickness of the line itself
              color: const Color.fromARGB(255, 169, 168, 168), // Color of the line
              indent: 80,           // Matches your left padding
              endIndent: 20,        // Matches your right padding
            ),
        ],
        SizedBox(height: 30,)
      ],
    );
  }

  Widget _buildItem(TransactionModel tx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // Icon Box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              // borderRadius: BorderRadius.circular(12),
              shape: BoxShape.circle
            ),
            child: SvgPicture.asset(
               _getTransactionIcon(tx.type),
              width: 24,
              height: 24,
              ),
          ),
          const SizedBox(width: 15),
          // Title & Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),
                ),
                Text(
                  tx.date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          // Amount
          Text(
            "${tx.isIncome ? '+' : '-'}Rp ${_formatCurrency(tx.amount)}",
            style: TextStyle(
              color: tx.isIncome ? Colors.green : Colors.black87,
              fontWeight: FontWeight.bold,
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
  String _getTransactionIcon(String type) {
  final lower = type.toLowerCase();

  if (lower.contains('withdraw')) {
    return 'assets/icons/withdraw.svg';
  } else if (lower.contains('deposit')) {
    return 'assets/icons/deposit.svg';
  } else if (lower.contains('transaction')) {
    return 'assets/icons/transaction.svg';
  } else if (lower.contains('interest')) {
    return 'assets/icons/interest.svg';
  }

  return 'assets/icons/default_transaction.svg';
}

}