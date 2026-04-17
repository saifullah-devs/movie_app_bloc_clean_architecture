import 'package:movie_app_bloc/core/constaints/app_url.dart';
import 'package:movie_app_bloc/core/network/network_services_api.dart';
import 'package:movie_app_bloc/features/tv_show/data/models/tv_show_list_model.dart';

abstract class TvShowRemoteDataSource {
  Future<TvShowListModel> getPopularTvShows(int page);
  Future<TvShowListModel> getRecentTvShows(int page);
}

class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource {
  final NetworkServicesApi _apiServices;

  TvShowRemoteDataSourceImpl(this._apiServices);

  @override
  Future<TvShowListModel> getPopularTvShows(int page) async {
    // Pass the endpoint and the query parameters separately!
    final response = await _apiServices.getApi(
      AppUrl.popularTVShowListEndPoint,
      queryParameters: {'page': page},
    );

    return TvShowListModel.fromJson(response);
  }

  @override
  Future<TvShowListModel> getRecentTvShows(int page) async {
    final response = await _apiServices.getApi(
      AppUrl.popularTVShowListEndPoint,
      queryParameters: {'page': page},
    );

    return TvShowListModel.fromJson(response);
  }
}
