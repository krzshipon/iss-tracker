import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_tracker_app/data/repository/auth/auth_repository.dart';
import 'package:iss_tracker_app/data/repository/auth/auth_repository_firebase.dart';
import 'package:iss_tracker_app/data/repository/iss_info/iss_info_repository.dart';
import 'package:iss_tracker_app/data/repository/iss_info/iss_info_repository_remote.dart';
import 'package:iss_tracker_app/data/service/auth_service.dart';
import 'package:iss_tracker_app/data/service/client/api_client.dart';
import 'package:iss_tracker_app/data/service/iss_info_service.dart';
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

//Clients
@riverpod
ApiClient issApiClient(Ref ref) {
  const baseUrl = 'http://api.open-notify.org';
  return ApiClient(baseUrl: baseUrl);
}

//Services
@riverpod
AuthService authService(Ref ref) {
  return AuthService();
}

@riverpod
ISSInfoService issInfoService(Ref ref) {
  return ISSInfoService(apiClient: ref.watch(issApiClientProvider));
}

//Repositories
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryFirebase(authService: ref.watch(authServiceProvider));
}

@riverpod
IssInfoRepository issInfoRepository(Ref ref) {
  return IssInfoRepositoryRemote(ref: ref);
}
