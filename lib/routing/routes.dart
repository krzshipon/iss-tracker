/// Defines route paths for the application.
///
/// This abstract class contains static constants for all route paths,
/// ensuring consistent and centralized route management.
///
/// ### Routes
/// - **`home`**: The home screen (`/`).
/// - **`auth`**: The authentication screen (`/auth`).
///
/// ### Example
/// ```dart
/// GoRoute(
///   path: Routes.home,
///   builder: (context, state) => const HomeView(),
/// );
/// ```
abstract class Routes {
  static const String home = '/';
  static const String auth = '/auth';
}
