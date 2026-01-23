import 'package:flutter/material.dart';

class LoanCard extends StatelessWidget {
  final double amount;
  final String date;
  final double progress; // 0.0 to 1.0
  final VoidCallback onDetailTap;

  const LoanCard({
    super.key,
    required this.amount,
    required this.date,
    required this.progress,
    required this.onDetailTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF8B0000), // Dark Red
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Pinjaman", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Sisa Pinjaman", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
                Text(
                  "Rp ${_formatCurrency(amount)}",
                  style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text("Tanggal Cicilan\n$date", style: const TextStyle(color: Colors.white, fontSize: 12)),
                const SizedBox(height: 15),
                InkWell(
                  onTap: onDetailTap,
                  child: const Row(
                    children: [
                      Text("Lihat Detail", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 14, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Circular Progress
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 8,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              Text(
                "${(progress * 100).toInt()}%",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
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