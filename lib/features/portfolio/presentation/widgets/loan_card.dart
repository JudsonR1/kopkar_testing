import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        color: const Color.fromRGBO(148, 0, 0, 1), // Dark Red
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
          SizedBox(
  width: 90,
  height: 110,
  child: Stack(
    clipBehavior: Clip.none,
    alignment:Alignment(0.6, -1), 
    children: [
      // Icon
      Positioned(
        top: -20,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(148, 0, 0, 1),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
               'assets/icons/loan_icon.svg',
              width: 36,
              height: 36,
              ),
        ),
      ),

      // Circle + centered text
      Positioned(
        bottom: -20,
        
        child: Stack(
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
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                height: 1, // important for vertical centering
              ),
            ),
          ],
        ),
      ),
    ],
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