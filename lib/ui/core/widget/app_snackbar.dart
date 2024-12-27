import 'dart:ui';

import 'package:flutter/material.dart';

class AppSnackbar {
  // Show a glass-type Snackbar at the top of the screen
  static void show(BuildContext context, String message, {Duration? duration}) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(
            color: theme.primaryColor
                .withOpacity(0.8), // Semi-transparent primary color
            borderRadius: BorderRadius.circular(10),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                message,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onPrimary, // Text color
                ),
              ),
            ),
          ),
        ),
        duration: duration ?? const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16, // Position at the top
          left: 16,
          right: 16,
        ),
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove shadow
      ),
    );
  }

  // Show a success glass-type Snackbar at the top of the screen
  static void showSuccess(BuildContext context, String message,
      {Duration? duration}) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(
            color: theme.primaryColor
                .withOpacity(0.8), // Semi-transparent primary color
            borderRadius: BorderRadius.circular(10),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: theme.colorScheme.onPrimary),
                  const SizedBox(width: 8),
                  Text(
                    message,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimary, // Text color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        duration: duration ?? const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16, // Position at the top
          left: 16,
          right: 16,
        ),
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove shadow
      ),
    );
  }

  // Show an error glass-type Snackbar at the top of the screen
  static void showError(BuildContext context, String message,
      {Duration? duration}) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.error
                .withOpacity(0.8), // Semi-transparent error color
            borderRadius: BorderRadius.circular(10),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.error, color: theme.colorScheme.onError),
                  const SizedBox(width: 8),
                  Text(
                    message,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onError, // Text color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        duration: duration ?? const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16, // Position at the top
          left: 16,
          right: 16,
        ),
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove shadow
      ),
    );
  }
}
