
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopkar_testing/features/auth/presentation/cubit/auth_state.dart';
import 'package:kopkar_testing/features/auth/domain/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
 AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> login(String identifier, String password) async {
    emit(AuthLoading());
    try {
   if (identifier.isEmpty || password.isEmpty) {
        emit(const AuthFailure("Please fill in all fields."));
        return;
      }
  final token = await _authRepository.login(identifier, password);
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
      } else {
        emit(const AuthFailure("Please fill in all fields."));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}