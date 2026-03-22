import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/features/movies/presentation/bloc/movies_bloc.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PREVIOUS BUTTON
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Previous'),
                    // If page is 1, set onPressed to null to automatically disable the button!
                    onPressed: state.page > 1
                        ? () {
                            context.read<MoviesBloc>().add(PageDecremental());
                            context.read<MoviesBloc>().add(
                              PopularMoviesFetched(),
                            );
                          }
                        : null,
                  ),
                ),

                // CURRENT PAGE INDICATOR
                Flexible(
                  flex: 2,
                  child: Text(
                    'Page ${state.page}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                // NEXT BUTTON
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    label: const Text('Next'),
                    icon: const Icon(Icons.arrow_forward),
                    // We put the icon on the right side using Directionality
                    // or just use ElevatedButton.icon standard formatting.
                    onPressed: () {
                      // 1. Increase the page number
                      context.read<MoviesBloc>().add(PageIncremented());
                      // 2. Fetch the new data!
                      context.read<MoviesBloc>().add(PopularMoviesFetched());
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
