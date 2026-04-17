import 'package:flutter/material.dart';
import 'package:movie_app_bloc/core/config/routes/routes.dart';
import 'package:movie_app_bloc/core/config/routes/routes_name.dart';
import 'package:movie_app_bloc/core/config/themes/app_themes.dart';
import 'package:movie_app_bloc/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServicesLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tv Show App',
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
