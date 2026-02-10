import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<void> call({
    required String memberId,
    required String email,
    required String phone,
    required String password,
  }) async {
    return await repository.register(
      memberId,
      email,
      phone,
      password,
    );
  }
}