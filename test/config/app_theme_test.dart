import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iss_tracker_app/config/app_theme.dart';

void main() {
  group('AppTheme', () {
    test('lightTheme should return a ThemeData object', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      expect(theme, isA<ThemeData>());
    });

    test('lightTheme should use deepOrange as the seed color', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      expect(theme.colorScheme.primary,
          ColorScheme.fromSeed(seedColor: Colors.deepOrange).primary);
    });

    test('lightTheme should enable Material 3', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      expect(theme.useMaterial3, isTrue);
    });

    test('lightTheme should have custom app bar theme', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      expect(theme.appBarTheme.centerTitle, isTrue);
      expect(theme.appBarTheme.elevation, 2);
      expect(theme.appBarTheme.scrolledUnderElevation, 4);
    });

    test('lightTheme should have custom text theme', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      expect(theme.textTheme.titleLarge?.fontSize, 24);
      expect(theme.textTheme.titleLarge?.fontWeight, FontWeight.bold);
      expect(theme.textTheme.titleMedium?.fontSize, 20);
      expect(theme.textTheme.titleMedium?.fontWeight, FontWeight.w600);
      expect(theme.textTheme.bodyLarge?.fontSize, 16);
      expect(theme.textTheme.bodyLarge?.fontWeight, FontWeight.normal);
      expect(theme.textTheme.bodyMedium?.fontSize, 14);
      expect(theme.textTheme.bodyMedium?.fontWeight, FontWeight.normal);
    });

    test('lightTheme should have custom elevated button theme', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      final buttonStyle = theme.elevatedButtonTheme.style;

      // Resolve the padding for the default state
      final padding = buttonStyle?.padding?.resolve(<WidgetState>{});
      expect(padding, const EdgeInsets.symmetric(horizontal: 24, vertical: 12));

      // Resolve the text style for the default state
      final textStyle = buttonStyle?.textStyle?.resolve(<WidgetState>{});
      expect(textStyle?.fontSize, 16);
      expect(textStyle?.fontWeight, FontWeight.w600);

      // Resolve the shape for the default state
      final shape = buttonStyle?.shape?.resolve(<WidgetState>{});
      expect(shape, isA<RoundedRectangleBorder>());
    });

    test('lightTheme should have custom card theme', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      expect(theme.cardTheme.elevation, 2);
      expect(theme.cardTheme.shape, isA<RoundedRectangleBorder>());
      expect(theme.cardTheme.margin, const EdgeInsets.all(8));
    });

    test('lightTheme should have custom input decoration theme', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      expect(theme.inputDecorationTheme.border, isA<OutlineInputBorder>());
      expect(theme.inputDecorationTheme.filled, isTrue);
      expect(theme.inputDecorationTheme.fillColor, Colors.grey.shade100);
      expect(theme.inputDecorationTheme.contentPadding,
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12));
    });

    test('lightTheme should have custom floating action button theme', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      expect(theme.floatingActionButtonTheme.elevation, 4);
      expect(
          theme.floatingActionButtonTheme.shape, isA<RoundedRectangleBorder>());
    });

    test('lightTheme should have custom divider theme', () {
      // Act
      final theme = AppTheme.lightTheme;

      // Assert
      expect(theme.dividerTheme.thickness, 1);
      expect(theme.dividerTheme.space, 1);
      expect(theme.dividerTheme.color, Colors.grey.shade300);
    });
  });
}
