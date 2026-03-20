import 'package:movie_app_bloc/features/movies/data/models/movie_list_model.dart';

abstract class MoviesApiRepository {
  Future<MovieListModel> fetchPopularMoviesList({int page = 1});
  Future<MovieListModel> fetchRecentMoviesList({int page = 1});
}
