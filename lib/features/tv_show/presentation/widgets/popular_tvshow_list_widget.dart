import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';
import 'package:movie_app_bloc/dependency_injection.dart';
import 'package:movie_app_bloc/core/utils/internet_exception_widget.dart';
import 'package:movie_app_bloc/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'tv_show_item_card.dart';

class PopularTvShowListWidget extends StatelessWidget {
  final int page;

  const PopularTvShowListWidget({super.key, this.page = 1});

  @override
  Widget build(BuildContext context) {
    // Industrial Standard: Inject via GetIt so it's fully decoupled
    return BlocProvider(
      create: (context) => getIt<TvShowBloc>()
        ..add(PageChanged(page))
        ..add(FetchPopularTvShows()),
      child: BlocBuilder<TvShowBloc, TvShowState>(
        builder: (context, state) {
          switch (state.popularTvShows.status) {
            case GetApiStatus.loading:
              return const SizedBox(
                height: 280,
                child: Center(child: CircularProgressIndicator.adaptive()),
              );

            case GetApiStatus.error:
              // Checking substring makes it safer than an exact string match
              if (state.popularTvShows.message?.toLowerCase().contains(
                    'network',
                  ) ??
                  false) {
                return SizedBox(
                  height: 280,
                  child: InterNetExceptionWidget(
                    onPress: () =>
                        context.read<TvShowBloc>().add(FetchPopularTvShows()),
                  ),
                );
              }
              return SizedBox(
                height: 280,
                child: Center(
                  child: Text(
                    state.popularTvShows.message ?? 'An error occurred',
                  ),
                ),
              );

            case GetApiStatus.complete:
              final tvShows = state.popularTvShows.data?.tvShows ?? [];

              if (tvShows.isEmpty) {
                return const SizedBox(
                  height: 280,
                  child: Center(child: Text('No Data Found')),
                );
              }

              return SizedBox(
                height: 280,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: tvShows.length,
                  // Adds padding to the start and end of the horizontal list
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 140,
                      child: TvShowItemCard(show: tvShows[index]),
                    );
                  },
                ),
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
