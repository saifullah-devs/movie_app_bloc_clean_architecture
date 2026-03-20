import 'package:movie_app_bloc/core/config/app_url.dart';
import 'package:movie_app_bloc/core/network/network_services_api.dart';
import 'package:movie_app_bloc/features/movies/data/models/movie_list_model.dart';

import 'movies_api_repository.dart';

class MoviesHttpApiRepository implements MoviesApiRepository {
  final _apiServices = NetworkServicesApi();

  @override
  Future<MovieListModel> fetchPopularMoviesList({int page = 1}) async {
    final response = await _apiServices.getApi(
      '${AppUrl.popularMoviesListEndPoint}$page',
    );
    return MovieListModel.fromJson(response);
  }

  @override
  Future<MovieListModel> fetchRecentMoviesList({int page = 1}) async {
    final response = await _apiServices.getApi(
      '${AppUrl.popularMoviesListEndPoint}$page',
    );
    return MovieListModel.fromJson(response);
  }
}
