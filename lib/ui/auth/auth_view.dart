import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_tracker_app/config/asset_config.dart';
import 'package:iss_tracker_app/routing/routes.dart';
import 'package:iss_tracker_app/ui/auth/view_model/auth_view_model.dart';
import 'package:iss_tracker_app/ui/core/widget/app_snackbar.dart';
import 'package:logging/logging.dart';

/// The `AuthView` is the entry point for authentication.
/// It handles anonymous sign-in and navigation to the home screen.
class AuthView extends ConsumerWidget {
  AuthView({super.key});

  final _logger = Logger('AuthView');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the authentication state
    final authState = ref.watch(authViewModelProvider);

    // Listen to changes in the authentication state
    ref.listen<AsyncValue<bool>>(authViewModelProvider, (previous, next) {
      _handleAuthStateChange(previous, next, context, ref);
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCircularImage(context),
                const SizedBox(height: 20),
                _buildAuthTitle(context),
                const SizedBox(height: 20),
                if (authState.isLoading) _buildLoadingText(context),
                if (authState.hasError)
                  _buildErrorText(context, authState.error),
                const SizedBox(height: 20),
                _buildSignInButton(context, authState, ref),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Handles authentication state changes.
  void _handleAuthStateChange(
    AsyncValue<bool>? previous,
    AsyncValue<bool> next,
    BuildContext context,
    WidgetRef ref,
  ) {
    _logger.info('Previous state: $previous, Next state: $next');

    if (next is AsyncData) {
      if (next.value == true) {
        // If the user is authenticated, navigate to the home screen
        _logger.info('User is authenticated. Navigating to Home screen.');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AppSnackbar.showSuccess(context, 'Sign in Success!');
          if (context.mounted) context.go(Routes.home);
        });
      } else if (previous?.value == null && next.value == false) {
        // If the user is not authenticated, trigger auto sign-in
        _logger.info('User is not authenticated. Triggering auto sign-in.');
        ref.read(authViewModelProvider.notifier).signInAnonymously();
      }
    }
  }

  /// Builds the circular image at the top.
  Widget _buildCircularImage(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surface,
        image: const DecorationImage(
          image: AssetImage(AssetConfig.appIcon), // Add your image asset
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Builds the authentication title.
  Widget _buildAuthTitle(BuildContext context) {
    return Text(
      'Welcome to ISS Tracker',
      style: TextStyle(
        color: Theme.of(context).colorScheme.surface,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// Builds the loading text.
  Widget _buildLoadingText(BuildContext context) {
    return Text(
      'Signing in...',
      style: TextStyle(
        color: Theme.of(context).colorScheme.surface,
        fontSize: 16,
      ),
    );
  }

  /// Builds the error text.
  Widget _buildErrorText(BuildContext context, dynamic error) {
    return Text(
      error.toString(),
      style: TextStyle(
        color: Theme.of(context).colorScheme.error,
        fontSize: 16,
      ),
    );
  }

  /// Builds the sign-in button.
  Widget _buildSignInButton(
    BuildContext context,
    AsyncValue<bool> authState,
    WidgetRef ref,
  ) {
    return SizedBox(
      width: 200, // Set a fixed width for the button
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: authState.isLoading
            ? SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.surface,
                ),
              )
            : ElevatedButton(
                onPressed: () async {
                  // Trigger manual sign-in
                  await ref
                      .read(authViewModelProvider.notifier)
                      .signInAnonymously();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign In Anonymously',
                  style: TextStyle(fontSize: 14),
                ),
              ),
      ),
    );
  }
}
