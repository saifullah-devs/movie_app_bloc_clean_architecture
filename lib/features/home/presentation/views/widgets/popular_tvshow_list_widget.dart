import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/core/utils/internet_exception_widget.dart';
import 'package:movie_app_bloc/features/movies/presentation/widgets/movie_item_card.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';
import 'package:movie_app_bloc/features/movies/presentation/bloc/movies_bloc.dart';

class PopularTvshowListWidget extends StatelessWidget {
  final int page;

  const PopularTvshowListWidget({super.key, this.page = 1});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc()
        ..add(PageChange(page: page))
        ..add(PopularMoviesFetched()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          switch (state.popularMoviesList.status) {
            case GetApiStatus.loading:
              return const SizedBox(
                height: 280,
                child: Center(child: CircularProgressIndicator()),
              );

            case GetApiStatus.error:
              if (state.popularMoviesList.message ==
                  'Network Error: Check your data or Wi-Fi connection.') {
                return InterNetExceptionWidget(
                  onPress: () {
                    context.read<MoviesBloc>().add(PopularMoviesFetched());
                  },
                );
              }
              return Center(
                child: Text(state.popularMoviesList.message.toString()),
              );

            case GetApiStatus.complete:
              if (state.popularMoviesList.data == null ||
                  state.popularMoviesList.data!.tvShow.isEmpty) {
                return const Center(child: Text('No Data Found'));
              }

              final tvShows = state.popularMoviesList.data!.tvShow;

              return SizedBox(
                height: 280,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: tvShows.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return MovieItemCard(show: tvShows[index]);
                  },
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
