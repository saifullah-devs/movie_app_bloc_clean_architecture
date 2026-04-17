import '../entities/tv_show_list_entity.dart';

abstract class TvShowRepository {
  Future<TvShowListEntity> fetchPopularTvShows({int page = 1});
  Future<TvShowListEntity> fetchRecentTvShows({int page = 1});
}
