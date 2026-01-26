import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopkar_testing/features/portfolio/presentation/screens/portfolio_screen.dart';
import 'package:kopkar_testing/test_page_3.dart';
import 'package:kopkar_testing/test_page_4.dart';

import 'features/home/presentation/screens/home_screen.dart';

class Navigation extends StatefulWidget {
  Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  final List _pages = [
    HomeScreen(),
    PortfolioScreen(),
    ThirdPage(),
    FourthPage(),
  ];
Widget _customBottomBar() {
  return Container(
    height: 80,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 8,
          color: Colors.black12,
          offset: Offset(0, -1),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
        _navItem(
          index: 0,
          label: 'Beranda',
           icon: SvgPicture.asset('assets/icons/home.svg',width: 18),
          // selectedIcon: Icon(Icons.home),
          selectedIcon: SvgPicture.asset('assets/icons/selected_home.svg',width: 18),
        ),
        _navItem(
          index: 1,
          label: 'Portofolio',
          icon: SvgPicture.asset('assets/icons/portfolio.svg',width: 22),
          selectedIcon: SvgPicture.asset('assets/icons/selected_portfolio.svg',width: 22),
        ),
        _navItem(
          index: 2,
          label: 'Formulir',
          icon: SvgPicture.asset('assets/icons/form.svg',width: 18),
          selectedIcon: SvgPicture.asset('assets/icons/selected_form.svg',width: 18),
        ),
        _navItem(
          index: 3,
          label: 'Pengaturan',
          icon: SvgPicture.asset('assets/icons/settings.svg',width: 22),
          selectedIcon: SvgPicture.asset('assets/icons/selected_settings.svg',width: 22),
        ),
      ],
    ),
  );
}

Widget _navItem({
  required int index,
  required String label,
  required Widget icon,
  required Widget selectedIcon,
}) {
  final isActive = _selectedIndex == index;

  return GestureDetector(
    onTap: () {
      setState(() => _selectedIndex = index);
    },
    behavior: HitTestBehavior.opaque,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 64, 
          height: 32, 
          decoration: BoxDecoration(
            color: isActive ? Colors.blue.shade50 : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: IconTheme(
              data: IconThemeData(
                color: isActive ? const Color(0xFF000080) : Colors.grey,
                size: 24,
              ),
              child: isActive ? selectedIcon : icon,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500, 
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
    index: _selectedIndex,
    children: [
       const HomeScreen(),      
       const PortfolioScreen(),
       const ThirdPage(),
       const FourthPage()
    ],
  ),
      bottomNavigationBar: _customBottomBar(),
  //     bottomNavigationBar: NavigationBarTheme(
  //       data: NavigationBarThemeData(
  //         indicatorColor: Colors.blue.shade50,
  //         labelTextStyle: WidgetStateProperty.all(
  //           const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
  //         ),
  //         iconTheme: WidgetStateProperty.resolveWith((states) {
  //           if (states.contains(WidgetState.selected)) {
  //             return const IconThemeData(color: Color(0xFF000080));
  //           }
  //           return const IconThemeData(color: Colors.grey);
  //         }),
  //       ),
  //       child: NavigationBar(
  //         height: 70,
  //         backgroundColor: Colors.white,
  //         elevation: 0,
  //         selectedIndex: _selectedIndex,
  //         onDestinationSelected: (index) {
  //           setState(() {
  //             _selectedIndex = index;
  //           });
  //         },
  //         destinations:  [
  //           NavigationDestination(
  //             icon:  SizedBox(
  //   width: 24,
  //   height: 24,
  //   child: SvgPicture.asset('assets/icons/selected_home.svg'),
  // ),           
  //             selectedIcon: Icon(Icons.home),
  //             label: 'Beranda',
  //             ),
  //             NavigationDestination(
  //             icon: Icon(Icons.pie_chart_outline),
  //             selectedIcon: Icon(Icons.pie_chart),
  //             label: 'Portofolio',
  //             ),
  //             NavigationDestination(
  //             icon: Icon(Icons.description_outlined),
  //             selectedIcon: Icon(Icons.description),
  //             label: 'Formulir',
  //             ),
  //             NavigationDestination(
  //             icon: Icon(Icons.settings_outlined),    
  //             selectedIcon: Icon(Icons.settings),
  //             label: 'Pengaturan',
  //             ),
  //         ],
        
        
  //       ),
  //     ),
    );
  }
}