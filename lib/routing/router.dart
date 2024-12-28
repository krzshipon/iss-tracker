import 'package:go_router/go_router.dart';
import 'package:iss_tracker_app/ui/auth/auth_view.dart';
import 'package:iss_tracker_app/ui/home/home_view.dart';

import 'routes.dart';

/// Creates and configures a [GoRouter] instance for application navigation.
///
/// This function defines the initial route and sets up the routes for the app.
/// It is used by the [appRouter] provider to provide a [GoRouter] instance
/// to the entire application.
///
/// ### Routes
/// - **`Routes.auth`**: Displays the [AuthView].
/// - **`Routes.home`**: Displays the [HomeView].
///
/// ### Returns
/// A fully configured [GoRouter] instance.
GoRouter setupAppRouter() => GoRouter(
      initialLocation: Routes.auth,
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) => HomeView(),
        ),
        GoRoute(
          path: Routes.auth,
          builder: (context, state) => AuthView(),
        ),
      ],
    );
