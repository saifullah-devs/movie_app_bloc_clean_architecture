part of 'tv_show_bloc.dart';

class TvShowState extends Equatable {
  final ApiResponse<TvShowListEntity> popularTvShows;
  final ApiResponse<TvShowListEntity> recentTvShows;
  final int page;

  const TvShowState({
    this.popularTvShows = const ApiResponse.loading(),
    this.recentTvShows = const ApiResponse.loading(),
    this.page = 1,
  });

  TvShowState copyWith({
    ApiResponse<TvShowListEntity>? popularTvShows,
    ApiResponse<TvShowListEntity>? recentTvShows,
    int? page,
  }) {
    return TvShowState(
      popularTvShows: popularTvShows ?? this.popularTvShows,
      recentTvShows: recentTvShows ?? this.recentTvShows,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [popularTvShows, recentTvShows, page];
}
