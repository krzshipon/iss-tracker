import 'package:flutter/foundation.dart'; // For kDebugMode
import 'package:logging/logging.dart';

/// Initializes a logger for debugging in development mode.
///
/// Sets the logging level to `Level.ALL` and prints logs to the console.
/// Only active in debug mode (`kDebugMode`).
///
/// ### Example
/// ```dart
/// void main() {
///   setupLogger();
///   runApp(MyApp());
/// }
/// ```
void setupLogger() {
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }
}
