import 'package:firebase_auth/firebase_auth.dart';
import 'package:iss_tracker_app/data/exception/auth_exceptions.dart';
import 'package:logging/logging.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _logger = Logger('AuthService');

  /// Checks if a user is currently authenticated.
  /// Returns `true` if a user is signed in, otherwise `false`.
  Future<bool> get isAuthenticated async {
    try {
      final user = _firebaseAuth.currentUser;
      _logger.info(
          'Auth check: User is ${user != null ? 'authenticated' : 'not authenticated'}');
      return user != null;
    } on FirebaseAuthException catch (e) {
      _logger.severe('Auth check failed: ${e.message}');
      throw AuthException(e.message ?? 'Auth check failed');
    } catch (e) {
      _logger.severe('Unexpected auth check error: $e');
      throw AuthException('Auth check error');
    }
  }

  /// Signs in a user anonymously.
  /// Returns the signed-in `User` object.
  Future<User> signInAnonymously() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      final user = userCredential.user;
      if (user == null) {
        _logger.severe('Anonymous sign-in failed: No user data');
        throw AuthException('No user data');
      }
      _logger.info('User signed in anonymously: ${user.uid}');
      return user;
    } on FirebaseAuthException catch (e) {
      _logger.severe('Anonymous sign-in failed: ${e.message}');
      throw AuthException(e.message ?? 'Sign-in failed');
    } catch (e) {
      _logger.severe('Unexpected sign-in error: $e');
      throw AuthException('Sign-in error');
    }
  }

  /// Signs out the current user.
  /// Returns `true` if the sign-out is successful.
  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      _logger.info('User logged out');
      return true;
    } on FirebaseAuthException catch (e) {
      _logger.severe('Logout failed: ${e.message}');
      throw AuthException(e.message ?? 'Logout failed');
    } catch (e) {
      _logger.severe('Unexpected logout error: $e');
      throw AuthException('Logout error');
    }
  }
}
