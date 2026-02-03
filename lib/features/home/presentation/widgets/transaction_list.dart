import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/transaction_entity.dart';


class TransactionList extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final groups = _groupTransactions(transactions);

    return Column(
      children: [

        for (var group in groups) ...[
          _buildMonthHeader(group),
        for (int i = 0; i < group.transactions.length; i++) ...[
          _buildItem(group.transactions[i]),
          

          if (i != transactions.length - 1)
            Divider(
              height: 1,            
              thickness: 1,       
              color: const Color.fromARGB(255, 169, 168, 168), 
              indent: 80,           
              endIndent: 20,        
            ),
        ],
        SizedBox(height: 30,)
      ],
      ]
    );
  }


Widget _buildMonthHeader(TransactionGroup group) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(
        horizontal: 25,
         vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(250, 250, 250, 1),
        boxShadow: [
          BoxShadow(
          color: const Color.fromARGB(26, 0, 0, 0),
          offset: const Offset(0, 4), 
         blurRadius: 4,
         spreadRadius: 0,
      ),
    ],
  ),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Month Name (e.g., "Jun 2025")
            Text(
              group.monthYear,
              style: TextStyle(
                color: Colors.blueGrey[800],
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Totals Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildSummaryRow("Outgoing: ", group.totalExpense),
                const SizedBox(height: 2),
                _buildSummaryRow("Incoming: ", group.totalIncome),
              ],
            ),
          ],
        ),
      ),
    );
  }

Widget _buildSummaryRow(String label, double amount) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 12, color: Colors.grey),
        children: [
          TextSpan(text: label),
          TextSpan(
            text: "Rp ${_formatCurrency(amount)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.black87
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildItem(TransactionEntity tx) {
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

List<TransactionGroup> _groupTransactions(List<TransactionEntity> rawList) {

    final Map<String, TransactionGroup> groups = {};


    final inputFormat = DateFormat("dd MMM yyyy, HH.mm");
    final outputFormat = DateFormat("MMM yyyy");
    final sortFormat = DateFormat("yyyyMM");

    for (var tx in rawList) {
      try {
        DateTime date = inputFormat.parse(tx.date);
        
        String sortKey = sortFormat.format(date); // "202506"
        String displayKey = outputFormat.format(date); // "Jun 2025"

        if (!groups.containsKey(sortKey)) {
          groups[sortKey] = TransactionGroup(
            monthYear: displayKey,
            transactions: [],
          );
        }

        final group = groups[sortKey]!;
        group.transactions.add(tx);
        if (tx.isIncome) {
          group.totalIncome += tx.amount;
        } else {
          group.totalExpense += tx.amount;
        }
      } catch (e) {
        debugPrint("Error parsing date: ${tx.date}");
      }
    }

    var sortedKeys = groups.keys.toList()..sort((a, b) => b.compareTo(a));

    return sortedKeys.map((key) => groups[key]!).toList();
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
class TransactionGroup {
  final String monthYear;
  final List<TransactionEntity> transactions;
  double totalIncome;
  double totalExpense;

  TransactionGroup({
    required this.monthYear,
    required this.transactions,
    this.totalIncome = 0.0,
    this.totalExpense = 0.0,
  });
}