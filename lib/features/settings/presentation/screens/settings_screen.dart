import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopkar_testing/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kopkar_testing/features/auth/presentation/cubit/auth_state.dart';
import 'package:kopkar_testing/features/auth/presentation/screens/auth_screen.dart';
import 'package:kopkar_testing/features/settings/presentation/screens/bank_account_screen.dart';
import 'package:kopkar_testing/features/settings/presentation/screens/change_password_screen.dart';
import 'package:kopkar_testing/features/settings/presentation/widgets/settings_menu.dart';

import '../widgets/profile_header.dart';

class SettingsScreen extends StatelessWidget {
   const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
  listenWhen: (prev, curr) => curr is AuthInitial,
  listener: (context, state) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const AuthScreen()),
      (_) => false,
    );
  },
      child: Scaffold(
        body: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child:  Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Personal Information", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
          ProfileHeader(name: "Stella Budiman", id: "50739"),
              SizedBox(height: 10),
                
          SettingsMenu(
            title: "Rekening Bank",
            icon: Icon(
                  Icons.account_balance_outlined,
                  color: Colors.blueGrey.shade700,
                  size: 24,
                ), 
            onTap: (){
              Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BankAccountScreen()),
    );
            }),
          SettingsMenu(
            title: "Ganti Password", 
            icon:Icon(
                  Icons.lock_outline,
                  color: Colors.blueGrey.shade700,
                  size: 24,
                ), 
            onTap: (){
              Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
    );
            }),
          SizedBox(height: 10),
             Divider(
                height: 1,            
                thickness: 0.8,       
                color: const Color.fromARGB(255, 169, 168, 168), 
                indent: 0,           
                endIndent: 0,        
              ),
          SizedBox(height: 10),
              SettingsMenu(
                title: "Logout",
                icon: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: SvgPicture.asset(
                    'assets/icons/logout_icon.svg',
                    width: 20,
                  ),
                ),
                onTap: () => _handleLogout(context),
                isDestructive: true,
              ),
            ],
          ),
        )
      ),
    );
  }

void _handleLogout(BuildContext context) {
 context.read<AuthCubit>().logout();
  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil( 
    MaterialPageRoute(builder: (context) => const AuthScreen()),
    (route) => false,
  );
}
}