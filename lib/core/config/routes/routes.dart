import 'package:flutter/material.dart';
import 'package:movie_app_bloc/core/config/routes/routes_name.dart';

import '../../../features/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '');

    // 2. Switch ONLY on the base path (e.g., "/movies")
    switch (uri.path) {
      case RoutesName.homeScreen:
      case RoutesName.homeScreenAlt:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const HomeScreen(),
        );

      case RoutesName.loginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const LoginScreen(),
        );

      case RoutesName.moviesScreen:
        // 3. Extract the variables safely from the URL!
        // If they aren't in the URL, provide safe default values.
        final sortParam = uri.queryParameters['sort'] ?? 'popular';
        final pageParam = uri.queryParameters['page'] ?? '1';

        // Convert the string page number to an integer safely
        final int pageNumber = int.tryParse(pageParam) ?? 1;

        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) =>
              MovieScreen(sortMode: sortParam, initialPage: pageNumber),
        );

      case RoutesName.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const SplashScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
