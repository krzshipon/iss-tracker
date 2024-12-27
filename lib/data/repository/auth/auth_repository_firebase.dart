import 'package:iss_tracker_app/data/repository/auth/auth_repository.dart';
import 'package:iss_tracker_app/data/service/auth_service.dart';
import 'package:iss_tracker_app/data/exception/auth_exceptions.dart';
import 'package:logging/logging.dart';

class AuthRepositoryFirebase implements AuthRepository {
  final AuthService _authService;
  final _logger = Logger('AuthRepositoryFirebase');

  bool? _isAuthenticated = false;

  /// Constructor to initialize the repository with an [AuthService].
  AuthRepositoryFirebase({required AuthService authService})
      : _authService = authService;

  /// Checks if the user is authenticated.
  /// Returns the cached authentication status if available, otherwise fetches it from [AuthService].
  @override
  Future<bool> get isAuthenticated async {
    try {
      if (_isAuthenticated != null) {
        _logger.info('Returning cached auth status: $_isAuthenticated');
        return _isAuthenticated!;
      }
      return await _authService.isAuthenticated;
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw AuthException('Auth check error');
    }
  }

  /// Logs out the current user.
  /// Updates the cached authentication status and returns `true` if successful.
  @override
  Future<bool> logout() async {
    try {
      final isLoggedOut = await _authService.logout();
      _isAuthenticated = isLoggedOut;
      _logger.info('User logged out: $isLoggedOut');
      return isLoggedOut;
    } on AuthException catch (e) {
      _logger.severe('Logout failed: ${e.message}');
      _isAuthenticated = false;
      throw AuthException(e.message);
    } catch (e) {
      _logger.severe('Logout error: $e');
      _isAuthenticated = false;
      throw AuthException('Logout error');
    }
  }

  /// Signs in the user anonymously.
  /// Updates the cached authentication status and returns `true` if successful.
  @override
  Future<bool> signInAnonymously() async {
    try {
      await _authService.signInAnonymously();
      _isAuthenticated = true;
      _logger.info('User signed in anonymously');
      return true;
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw AuthException('Sign-in error');
    }
  }
}
