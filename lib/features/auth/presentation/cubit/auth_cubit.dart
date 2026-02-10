
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/auth/domain/usecases/login_usecase.dart';
import 'package:kopkar_testing/features/auth/domain/usecases/logout_usecase.dart';
import 'package:kopkar_testing/features/auth/domain/usecases/register_usecase.dart';
import 'package:kopkar_testing/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final RegisterUseCase _registerUseCase;
 AuthCubit(this._loginUseCase,this._logoutUseCase, this._registerUseCase) : super(AuthInitial());

  Future<void> login(String identifier, String password) async {
    emit(AuthLoading());
    try {
   if (identifier.isEmpty || password.isEmpty) {
        emit(const AuthFailure("Please fill in all fields."));
        return;
      }
 await _loginUseCase.call(identifier, password);
      emit(const AuthSuccess("Login Successful!"));

    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register({
    required String memberId,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      if (password != confirmPassword) {
        emit(const AuthFailure("Passwords do not match."));
        return;
      }
      if (memberId.isNotEmpty && email.isNotEmpty && phone.isNotEmpty) {
        emit(const AuthSuccess("Registration Successful!"));
        await _registerUseCase.call(memberId: memberId, email: email, phone: phone, password: password);
      } else {
        emit(const AuthFailure("Please fill in all fields."));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await _logoutUseCase.call();
      emit(AuthInitial()); 
    } catch (e) {
      emit(const AuthFailure("Failed to logout"));
    }
  }
}