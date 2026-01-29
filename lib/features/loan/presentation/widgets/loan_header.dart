import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopkar_testing/core/utils/format_currency.dart';
import 'package:kopkar_testing/features/loan/domain/entities/loan_entity.dart';
class LoanHeader extends StatelessWidget {
  final LoanEntity loans;
    final VoidCallback onTap;
  const LoanHeader({super.key, required this.loans,  required this.onTap,});

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        const SizedBox(height: 20),
        
        // 1. The Gauge Card
        _LoanGaugeCard(loans: loans, onTap: onTap,),
        
        const SizedBox(height: 40),

        // 2. The Green Info Banner
        Container(
          width: double.infinity,
          // color: const Color(0xFFE8F5E9), 
           decoration: BoxDecoration(
    color: const Color.fromRGBO(239, 248, 255, 1),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.8),
        blurRadius: 8,
        offset: const Offset(0, 3), // shadow below
      ),
    ],
  ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Row(
            children: [
              const Icon(Icons.info, color: Colors.green, size: 20),
              const SizedBox(width: 10),
              Text(
                "Sudah membayar ${loans.paidCount} dari total ${loans.paymentHistory.length} cicilan",
                style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoanGaugeCard extends StatelessWidget {
   final LoanEntity loans;
   final VoidCallback onTap;
  const _LoanGaugeCard({super.key, required this.loans, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // color: const Color(0xFFB71C1C), 
                   gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(110, 0, 0, 1),       
          Color.fromRGBO(180, 0, 0, 1),      
          Color.fromRGBO(217, 0, 0, 1)
        ],
      ),
              borderRadius: BorderRadius.circular(8)
            ),
            // child: const Icon(Icons.account_balance_wallet, color: Colors.white, size: 24),
            child: SvgPicture.asset('assets/icons/loan_icon.svg',width: 44),
          ),
          const SizedBox(height: 10),
          
          SizedBox(
            height: 120, 
            width: 220,
            child: CustomPaint(
              painter: _GaugePainter(loans: loans),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Sisa Pinjaman", style: TextStyle(color: Colors.black, fontSize: 12)),
                     Text("Rp ${FormatCurrencyUtils.formatCurrency(loans.loanBalance)} ", 
                      style: TextStyle(color: Color(0xFFB71C1C), fontSize: 24, fontWeight: FontWeight.bold)
                    ),
                    Text("Dari Rp  ${FormatCurrencyUtils.formatCurrency(loans.totalLoan)}", style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          Row(
            children: [
              Expanded(child: _buildButton("Lunasi Semua",(){})),
              const SizedBox(width: 10),
              Expanded(child: _buildButton("Simulasi",onTap)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFB71C1C),
        side: const BorderSide(color: Color(0xFFB71C1C)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text),
    );
  }
}

class _GaugePainter extends CustomPainter {
     final LoanEntity loans;

  const _GaugePainter({required this.loans});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    const strokeWidth = 18.0;

    final bgPaint = Paint()
      ..color = const Color(0xFFFFEBEE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      math.pi, math.pi, false, bgPaint,
    );

    final progressPaint = Paint()
      ..color = const Color(0xFFD32F2F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      math.pi, math.pi * (loans.loanBalance / loans.totalLoan ), false, progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}