import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/core/config/routes/routes_name.dart';
import 'package:movie_app_bloc/core/services/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController()
        .getUserFromPreferences()
        .then((user) {
          if (SessionController().isLoggedIn == true) {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.homeScreen,
                (route) => false,
              ),
            );
          } else {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.loginScreen,
                (route) => false,
              ),
            );
          }
        })
        .catchError((error) {
          debugPrint('Error fetching user data: $error');
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.loginScreen,
              (route) => false,
            ),
          );
        });
  }
}
