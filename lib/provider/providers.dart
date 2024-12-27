import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_tracker_app/routing/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provides a [GoRouter] instance for app navigation.
///
/// This provider uses [setupAppRouter] to configure the router with defined routes,
/// ensuring consistent routing across the application.
@riverpod
GoRouter appRouter(Ref ref) {
  return setupAppRouter();
}
