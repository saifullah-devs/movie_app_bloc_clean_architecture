part of 'tv_show_bloc.dart';

sealed class TvShowEvent extends Equatable {
  const TvShowEvent();

  @override
  List<Object> get props => [];
}

class FetchPopularTvShows extends TvShowEvent {}

class FetchRecentTvShows extends TvShowEvent {}

class PageChanged extends TvShowEvent {
  final int page;
  const PageChanged(this.page);

  @override
  List<Object> get props => [page];
}
