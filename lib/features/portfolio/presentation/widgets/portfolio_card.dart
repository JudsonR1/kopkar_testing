import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  final String title;
  final double amount;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconBackgroundColor;
  final VoidCallback onDetailTap; // Clickable action
  final ImageProvider? iconBackgroundImage;
  final Color iconColor;

  const PortfolioCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.onDetailTap,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.iconBackgroundColor = const Color(0xFFE3F2FD), // Light Blue default
    this.iconBackgroundImage,
    this.iconColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromRGBO(208, 213, 221, 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Rp ${_formatCurrency(amount)}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: onDetailTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Lihat Detail",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 14, color: textColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Icon Section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: iconBackgroundImage == null ? iconBackgroundColor : null,
                image: iconBackgroundImage != null
        ? DecorationImage(
            image: iconBackgroundImage!,
            fit: BoxFit.cover,
          )
        : null,
            ),
            child: Icon(icon, size: 35, color: iconColor),
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