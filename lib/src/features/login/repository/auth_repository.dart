abstract class AuthRepository {
  Future<bool> login(String username, String password);

  Future<void> register(String username, String password);

  Future<void> logout();
}
