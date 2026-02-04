import 'package:flutter/material.dart';

class SavingsHeader extends StatelessWidget {
  final double balance;
  final IconData icon;
  final Color iconBGColor;
  final ImageProvider? iconBGImage;
  const SavingsHeader({
    super.key, 
     this.iconBGColor = const Color.fromARGB(255, 227, 242, 253),
     this.iconBGImage,
    required this.balance,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBGImage == null ? iconBGColor : null,
              image: iconBGImage != null ?
               DecorationImage(
            image: iconBGImage!,
            fit: BoxFit.cover,
          )
        : null
              ,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Text(
              "Rp ${_formatCurrency(balance)}",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
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