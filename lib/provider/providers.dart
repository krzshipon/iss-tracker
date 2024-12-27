import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_tracker_app/data/repository/auth/auth_repository.dart';
import 'package:iss_tracker_app/data/repository/auth/auth_repository_firebase.dart';
import 'package:iss_tracker_app/data/service/auth_service.dart';
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

//Services
@riverpod
AuthService authService(Ref ref) {
  return AuthService();
}

//Repositories
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryFirebase(authService: ref.watch(authServiceProvider));
}
