import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/auth/presentation/cubit/auth_state.dart';

import '../cubit/auth_cubit.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
       padding: EdgeInsets.fromLTRB(
        24,
        24,
        24,
        bottomPadding + 24, 
      ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi, Selamat Datang!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Silakan masukkan data untuk melanjutkan penggunaan aplikasi.",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _identifierController,
                label: 'Nomor Anggota atau Email',
                hint: 'Example@gmail.com',
                icon: Icons.person_outline,
              ),
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                hint: '********',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        activeColor: const Color(0xFF000080),
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      const Text("Remember Me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return CustomButton(
                    text: 'Login',
                    isLoading: state is AuthLoading,
                    onTap: () {
                      context.read<AuthCubit>().login(
                            _identifierController.text,
                            _passwordController.text,
                          );
                    },
                  );
                },
              ),
            ],
          ),
      ),
    );
    
  }
}