import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display status text based on the authentication state
            if (authState.isLoading)
              const Text('Signing in...', style: TextStyle(fontSize: 16))
            else if (authState.hasError)
              Text(
                authState.error.toString(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.error, fontSize: 16),
              ),

            const SizedBox(height: 20),

            // Sign In Anonymously button
            SizedBox(
              width: 200, // Set a fixed width for the button
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: authState.isLoading
                    ? SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Theme.of(context).colorScheme.primary,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          elevation: 4,
                        ),
                        child: const Text('Sign In Anonymously',
                            style: TextStyle(fontSize: 14)),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
