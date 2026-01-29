import 'package:flutter/material.dart';
import 'package:kopkar_testing/core/utils/format_currency.dart';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoanSimulationScreen(),
  ));
}

class LoanSimulationScreen extends StatefulWidget {
  const LoanSimulationScreen({super.key});

  @override
  State<LoanSimulationScreen> createState() => _LoanSimulationScreenState();
}

class _LoanSimulationScreenState extends State<LoanSimulationScreen> {
  // Initial values based on the image
  double _loanAmount = 3000000;
  double _tenorMonths = 10;
  final double _interestRate = 0.01; // 1% flat

 

  // Calculate monthly installment
  double get _monthlyInstallment {
    double principal = _loanAmount / _tenorMonths;
    double interest = _loanAmount * _interestRate;
    return principal + interest;
  }

  @override
  Widget build(BuildContext context) {
    // Define the dark red color from your code
    final Color darkRed = const Color.fromRGBO(131, 0, 0, 1);
    final Color navyBlue = const Color(0xFF000080);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Simulasi Pinjaman",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              darkRed,
              darkRed,
              darkRed.withOpacity(0.9),
              Colors.white,
            ],
            stops: const [0.0, 0.4, 0.6, 1.0],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // --- TOP SUMMARY SECTION ---
                    const Text(
                      "Perkiraan Cicilan kamu",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${FormatCurrencyUtils.formatCurrency(_monthlyInstallment)}/Bulan",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Selama ${_tenorMonths.toInt()} Bulan",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "*Perhitungan dengan suku bunga 1% flat per bulan",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // --- LOAN AMOUNT CARD ---
                    _buildInputCard(
                      title: "Jumlah Pinjaman",
                      valueDisplay: FormatCurrencyUtils.formatCurrency(_loanAmount),
                      child: SliderTheme(
                        data: _customSliderTheme(navyBlue),
                        child: Slider(
                          value: _loanAmount,
                          min: 0,
                          max: 10000000,
                          divisions: 100, // Steps of 500k approx
                          onChanged: (value) {
                            setState(() {
                              _loanAmount = value;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // --- TENOR CARD ---
                    _buildInputCard(
                      title: "Tenor (bulan)",
                      valueDisplay: _tenorMonths.toInt().toString(),
                      child: SliderTheme(
                        data: _customSliderTheme(navyBlue),
                        child: Slider(
                          thumbColor: Colors.blue[400],
                          value: _tenorMonths,
                          min: 1,
                          max: 24,
                          divisions: 23,
                          onChanged: (value) {
                            setState(() {
                              _tenorMonths = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --- BOTTOM BUTTON ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: ()  => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: navyBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Oke, kembali ke pinjaman",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard({
    required String title,
    required String valueDisplay,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10,5,5,5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            valueDisplay,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 0),
          SizedBox(
            width: double.infinity,
            child: child,
          ),
        ],
      ),
    );
  }

  SliderThemeData _customSliderTheme(Color color) {
    return SliderThemeData(
      activeTrackColor: color,
      inactiveTrackColor: Colors.grey[300],
      thumbColor: Colors.blue[400], 
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
      overlayColor: color.withOpacity(0.2),
      trackHeight: 4.0,
    );
  }
}

