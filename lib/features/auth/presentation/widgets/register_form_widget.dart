import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import 'custom_text_field.dart';
import 'custom_button.dart';
import 'package:kopkar_testing/features/auth/presentation/cubit/auth_state.dart';


class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _memberIdController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Daftar Sekarang",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          CustomTextField(
            controller: _memberIdController,
            label: 'Nomor Anggota',
            hint: 'Masukkan nomor anggota',
            icon: Icons.person_outline,
          ),
          CustomTextField(
            controller: _emailController,
            label: 'Email',
            hint: 'Input Email',
            icon: Icons.email_outlined,
            inputType: TextInputType.emailAddress,
          ),
          CustomTextField(
            controller: _phoneController,
            label: 'Nomor Ponsel',
            hint: '+62 xxxxxxxxxx',
            icon: Icons.phone_android_outlined,
            inputType: TextInputType.phone,
          ),
          CustomTextField(
            controller: _passwordController,
            label: 'Password',
            hint: 'Input Password',
            icon: Icons.lock_outline,
            isPassword: true,
          ),
          CustomTextField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            hint: 'Input Password',
            icon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 30),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return CustomButton(
                text: 'Register',
                isLoading: state is AuthLoading,
                onTap: () {
                  context.read<AuthCubit>().register(
                        memberId: _memberIdController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                        password: _passwordController.text,
                        confirmPassword: _confirmPasswordController.text,
                      );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}