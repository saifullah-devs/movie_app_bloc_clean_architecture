import 'package:flutter/material.dart';
import 'package:movie_app_bloc/core/config/routes/routes_name.dart';
import 'package:movie_app_bloc/features/tv_show/domain/entities/tv_show_entity.dart';

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
        final pageParam = uri.queryParameters['page'] ?? '1';

        final int pageNumber = int.tryParse(pageParam) ?? 1;

        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) =>
              TvShowScreen(initialPage: pageNumber),
        );

      case String path when path.startsWith(RoutesName.tvShowDetailScreen):
        final segments = path.split('/');

        String? permalink;
        if (segments.length > 2) {
          permalink = segments[2];
        }

        final showEntity = settings.arguments as TvShowEntity?;

        if (showEntity != null) {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => TvShowDetailScreen(show: showEntity),
          );
        }

        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('Deep linking to: $permalink')),
          ),
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
