import 'package:iss_tracker_app/data/exception/auth_exceptions.dart';
import 'package:iss_tracker_app/provider/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logging/logging.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  final _logger = Logger('AuthViewModel');

  @override
  Future<bool> build() async {
    final isAuthenticated =
        await ref.watch(authRepositoryProvider).isAuthenticated;
    return isAuthenticated;
  }

  /// Checks if the user is authenticated and updates the state.
  Future<void> checkAuthentication() async {
    _logger.info('Checking authentication status');
    state = const AsyncLoading();

    try {
      final isAuthenticated =
          await ref.read(authRepositoryProvider).isAuthenticated;
      _logger.info('Authentication check successful: $isAuthenticated');
      state = AsyncData(isAuthenticated);
    } on AuthException catch (e) {
      _logger.severe('Authentication check failed: ${e.message}');
      state = AsyncError(e, StackTrace.current);
    } catch (e) {
      _logger.severe('Unexpected error during authentication check: $e');
      state = AsyncError('An unexpected error occurred', StackTrace.current);
    }
  }

  /// Signs in the user anonymously and updates the state.
  Future<void> signInAnonymously() async {
    _logger.info('Starting anonymous sign-in');
    state = const AsyncLoading();

    try {
      await ref.read(authRepositoryProvider).signInAnonymously();
      _logger.info('Anonymous sign-in successful');
      state = const AsyncData(true);
    } on AuthException catch (e) {
      _logger.severe('Anonymous sign-in failed: ${e.message}');
      state = AsyncError(e, StackTrace.current);
    } catch (e) {
      _logger.severe('Unexpected error during anonymous sign-in: $e');
      state = AsyncError('An unexpected error occurred', StackTrace.current);
    }
  }

  /// Logs out the user and updates the state.
  Future<void> logout() async {
    _logger.info('Starting logout');
    state = const AsyncLoading();

    try {
      await ref.read(authRepositoryProvider).logout();
      _logger.info('Logout successful');
      state = const AsyncData(false);
    } on AuthException catch (e) {
      _logger.severe('Logout failed: ${e.message}');
      state = AsyncError(e, StackTrace.current);
    } catch (e) {
      _logger.severe('Unexpected error during logout: $e');
      state = AsyncError('An unexpected error occurred', StackTrace.current);
    }
  }
}
