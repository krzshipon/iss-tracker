import 'package:flutter/material.dart';

/// A utility class that provides a centralized and reusable theme configuration
/// for the application. This class defines a consistent and customizable
/// Material 3 theme using a seed color (`Colors.deepOrange`).
///
/// The theme includes customizations for:
/// - Color scheme
/// - App bar
/// - Text styles
/// - Buttons
/// - Cards
/// - Input decorations
/// - Floating action buttons
/// - Dividers
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme, // Use the light theme
///   home: MyHomePage(),
/// );
/// ```
///
/// This approach ensures a consistent design across the app and makes it easy
/// to update the theme in one place.
class AppTheme {
  /// Returns a [ThemeData] object configured for a light theme.
  ///
  /// The theme is based on Material 3 design principles and uses
  /// `Colors.deepOrange` as the seed color for the color scheme.
  static ThemeData get lightTheme {
    return ThemeData(
      // Define a color scheme using a seed color
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepOrange,
        brightness: Brightness.light, // Adjust brightness for light theme
      ),
      useMaterial3: true, // Enable Material 3 design
      // Customize app bar theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 2,
        scrolledUnderElevation: 4,
      ),
      // Customize text theme
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      ),
      // Customize button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      // Customize card theme
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(8),
      ),
      // Customize input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      // Customize floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      // Customize divider theme
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: Colors.grey.shade300,
      ),
    );
  }
}
