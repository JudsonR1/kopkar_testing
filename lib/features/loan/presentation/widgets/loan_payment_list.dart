import 'package:flutter/material.dart';
import 'package:kopkar_testing/core/utils/format_currency.dart';
import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';

import '../../domain/entities/loan_payment.dart'; 

class LoanPaymentList extends StatelessWidget {
  final LoanEntity loans;
  const LoanPaymentList({super.key, required this.loans});

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Section
            _buildRow("Pembayaran Selanjutnya", loans.paymentHistory[loans.paymentHistory.where((payment) => payment.isPaid).length].date),
            const Divider(height: 30),
            _buildRow("Pokok Hutang Dibayar", "Rp ${FormatCurrencyUtils.formatCurrency((loans.paymentHistory.where((payment) => payment.isPaid).length) * (loans.totalLoan/loans.paymentHistory.length))}"),
            const SizedBox(height: 30),
            
            // History Section Header
            const Text("History Tagihan", 
              style: TextStyle(color: Colors.grey, fontSize: 14)
            ),
            const SizedBox(height: 10),
            
            // The List
            ...loans.paymentHistory.map((entity) => _buildHistoryItem(entity)),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[600])),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildHistoryItem(LoanPayment entity) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entity.title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(entity.date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Rp ${FormatCurrencyUtils.formatCurrency(entity.amount)}", 
                style: const TextStyle(fontWeight: FontWeight.w600)
              ),
              if (entity.isPaid)
                _buildStatusChip("Lunas", Colors.green)
              else 
                _buildStatusChip("Belum Lunas", Colors.red)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, MaterialColor color) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label,
        style: TextStyle(color: color.shade700, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

 
}