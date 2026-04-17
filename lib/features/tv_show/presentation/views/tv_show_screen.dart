import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';
import 'package:movie_app_bloc/dependency_injection.dart';
import 'package:movie_app_bloc/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import '../widgets/tv_show_item_card.dart';
import '../widgets/tv_show_pagination_widget.dart';

class TvShowScreen extends StatelessWidget {
  final int initialPage;

  const TvShowScreen({super.key, required this.initialPage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TvShowBloc>()
        ..add(PageChanged(initialPage))
        ..add(FetchPopularTvShows()),
      child: const TvShowView(),
    );
  }
}

class TvShowView extends StatelessWidget {
  const TvShowView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowBloc, TvShowState>(
      buildWhen: (prev, curr) =>
          prev.popularTvShows.status != curr.popularTvShows.status ||
          prev.page != curr.page,
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAdaptiveAppBar(
            context,
            'Popular Shows - Page ${state.page}',
          ),

          body: RefreshIndicator.adaptive(
            onRefresh: () async =>
                context.read<TvShowBloc>().add(FetchPopularTvShows()),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: _buildBody(context, state),
              ),
            ),
          ),
          bottomNavigationBar: const TvShowPaginationWidget(),
        );
      },
    );
  }

  PreferredSizeWidget _buildAdaptiveAppBar(BuildContext context, String title) {
    if (!kIsWeb && Platform.isIOS) {
      return CupertinoNavigationBar(
        middle: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      );
    }
    return AppBar(title: Text(title), centerTitle: true);
  }

  Widget _buildBody(BuildContext context, TvShowState state) {
    switch (state.popularTvShows.status) {
      case GetApiStatus.initial:
      case GetApiStatus.loading:
        return const Center(child: CircularProgressIndicator.adaptive());

      case GetApiStatus.error:
        return _buildErrorWidget(
          context,
          state.popularTvShows.message ?? 'Error',
        );

      case GetApiStatus.complete:
        final tvShows = state.popularTvShows.data?.tvShows ?? [];
        if (tvShows.isEmpty) {
          return const Center(child: Text('No TV Shows Found'));
        }

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          itemCount: tvShows.length,
          physics:
              const AlwaysScrollableScrollPhysics(), // Required for RefreshIndicator
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) => TvShowItemCard(show: tvShows[index]),
        );
    }
  }

  Widget _buildErrorWidget(BuildContext context, String message) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 60, color: Colors.redAccent),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                context.read<TvShowBloc>().add(FetchPopularTvShows()),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
