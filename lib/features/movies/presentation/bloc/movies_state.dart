part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final ApiResponse<MovieListModel> popularMoviesList;
  final ApiResponse<MovieListModel> recentMoviesList;
  final int page;

  const MoviesState({
    required this.popularMoviesList,
    required this.recentMoviesList,
    this.page = 1,
  });

  MoviesState copyWith({
    ApiResponse<MovieListModel>? popularMoviesList,
    ApiResponse<MovieListModel>? recentMoviesList,
    int? page,
  }) {
    return MoviesState(
      popularMoviesList: popularMoviesList ?? this.popularMoviesList,
      recentMoviesList: recentMoviesList ?? this.recentMoviesList,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [popularMoviesList, recentMoviesList, page];
}
