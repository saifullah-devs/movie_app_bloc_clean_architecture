import 'package:flutter/material.dart';
import 'package:movie_app_bloc/core/config/routes/routes_name.dart';
import 'package:movie_app_bloc/dependency_injection.dart';
import 'package:movie_app_bloc/core/services/session_controller.dart';

import '../widgets/popular_tvshow_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              SessionController storage = getIt<SessionController>();
              storage.clearSession();
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.loginScreen,
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Popular',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (context.mounted) {
                            Navigator.pushNamed(
                              context,
                              '${RoutesName.moviesScreen}?sort=popular&page=1',
                            );
                          }
                        });
                      },
                      child: const Text('See all'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

              PopularTvShowListWidget(page: 1),

              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'Recently Added',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (context.mounted) {
                            Navigator.pushNamed(
                              context,
                              '${RoutesName.moviesScreen}?sort=popular&page=1',
                            );
                          }
                        });
                      },
                      child: const Text('See all'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

              PopularTvShowListWidget(page: 2),
            ],
          ),
        ),
      ),
    );
  }
}
