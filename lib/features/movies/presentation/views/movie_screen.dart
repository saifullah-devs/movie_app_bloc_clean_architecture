import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/features/movies/presentation/widgets/movie_item_card.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';
import 'package:movie_app_bloc/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movie_app_bloc/features/movies/presentation/widgets/navigation_widget.dart';

class MovieScreen extends StatefulWidget {
  final String sortMode;
  final int initialPage;

  const MovieScreen({
    super.key,
    required this.sortMode,
    required this.initialPage,
  });

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc()
        ..add(PageChange(page: widget.initialPage))
        ..add(PopularMoviesFetched()),

      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Popular Movies - Page ${state.page}')),

            body: _buildBody(state),

            bottomNavigationBar: NavigationWidget(),
          );
        },
      ),
    );
  }

  Widget _buildBody(MoviesState state) {
    switch (state.popularMoviesList.status) {
      case GetApiStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case GetApiStatus.error:
        return Center(child: Text(state.popularMoviesList.message.toString()));

      case GetApiStatus.complete:
        if (state.popularMoviesList.data == null ||
            state.popularMoviesList.data!.tvShow.isEmpty) {
          return const Center(child: Text('No Movies Found'));
        }

        final tvShows = state.popularMoviesList.data!.tvShow;

        return Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: tvShows.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 0.5,
            ),
            itemBuilder: (context, index) {
              return MovieItemCard(show: tvShows[index]);
            },
          ),
        );

      default:
        return const SizedBox();
    }
  }
}
