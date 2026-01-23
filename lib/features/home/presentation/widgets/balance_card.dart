import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double totalBalance;
  final double mandatory;
  final double voluntary;

  const BalanceCard({
    super.key,
    required this.totalBalance,
    required this.mandatory,
    required this.voluntary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
         image: const DecorationImage(
    image: AssetImage('assets/home_page/balance_card_bg.png'),
    fit: BoxFit.cover, 
  ),
        borderRadius: BorderRadius.circular(20),
         border: Border.all(
    color: Colors.white, // white outline
    width: 1.5, // thickness
  ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Total Saldo", style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Rp ${_formatCurrency(totalBalance)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.visibility_off_outlined, color: Colors.white70, size: 20),
            ],
          ),
          const SizedBox(height: 20),
          // Sub-balances
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSubBalance("Simpanan Wajib", mandatory),
              _buildSubBalance("Simpanan Sukarela", voluntary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubBalance(String label, double amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 10)),
        const SizedBox(height: 2),
        Text(
          "Rp ${_formatCurrency(amount)}",
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }
}