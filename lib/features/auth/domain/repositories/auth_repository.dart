abstract class AuthRepository {
  Future<String> login(String email, String password);
  Future<void> logout();
  Future<void> register(String memberId, String email, String phone, String password);
}