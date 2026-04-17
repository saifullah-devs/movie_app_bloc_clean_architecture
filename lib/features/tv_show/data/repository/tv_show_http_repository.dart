import 'package:movie_app_bloc/features/tv_show/domain/entities/tv_show_list_entity.dart';
import 'package:movie_app_bloc/features/tv_show/domain/repository/tv_show_repository.dart';

import '../datasource/tv_show_remote_data_source.dart';

class TvShowHttpApiRepository implements TvShowRepository {
  final TvShowRemoteDataSource remoteDataSource;

  TvShowHttpApiRepository(this.remoteDataSource);

  @override
  Future<TvShowListEntity> fetchPopularTvShows({int page = 1}) async {
    return await remoteDataSource.getPopularTvShows(page);
  }

  @override
  Future<TvShowListEntity> fetchRecentTvShows({int page = 1}) async {
    return await remoteDataSource.getRecentTvShows(page);
  }
}
