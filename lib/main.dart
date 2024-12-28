import 'package:firebase_core/firebase_core.dart'; // For Firebase integration
import 'package:flutter/foundation.dart'; // For platform-specific functionality
import 'package:flutter/material.dart'; // For Flutter UI components
import 'package:flutter_riverpod/flutter_riverpod.dart'; // For state management
import 'package:flutter_web_plugins/url_strategy.dart'; // For web URL strategy
import 'package:iss_tracker_app/config/app_theme.dart';
import 'package:iss_tracker_app/config/firebase_options.dart'; // Firebase configuration
import 'package:iss_tracker_app/provider/providers.dart'; // Application providers
import 'package:iss_tracker_app/util/logger.dart'; // Custom logger utility
import 'package:logging/logging.dart'; // For logging functionality

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Use PathUrlStrategy for web to remove the '#' from URLs
  if (kIsWeb) {
    setUrlStrategy(const PathUrlStrategy());
  }

  // Set up a custom logger for debugging and monitoring
  setupLogger();

  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the application wrapped in a ProviderScope for state management
  runApp(
    ProviderScope(
      child: IssTrackerApp(),
    ),
  );
}

/// Main application widget
class IssTrackerApp extends ConsumerWidget {
  IssTrackerApp({super.key});
  final _logger = Logger('IssTrackerApp');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _logger.info('Building the app...');

    // Retrieve the app router from the provider
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'ISS Tracker',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter, // Use the app router
    );
  }
}
