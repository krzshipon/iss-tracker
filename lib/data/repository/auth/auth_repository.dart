abstract class AuthRepository {
  Future<bool> get isAuthenticated;
  Future<bool> signInAnonymously();
  Future<bool> logout();
}
