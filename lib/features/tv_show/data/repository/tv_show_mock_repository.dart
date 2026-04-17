import 'package:movie_app_bloc/features/tv_show/domain/entities/tv_show_list_entity.dart';
import 'package:movie_app_bloc/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:movie_app_bloc/features/tv_show/data/models/tv_show_list_model.dart';

class TvShowMockApiRepository implements TvShowRepository {
  @override
  Future<TvShowListEntity> fetchPopularTvShows({int page = 1}) async {
    return _generateMockData(page);
  }

  @override
  Future<TvShowListEntity> fetchRecentTvShows({int page = 1}) async {
    return _generateMockData(page);
  }

  /// Private helper to simulate network delay and return mock data
  Future<TvShowListEntity> _generateMockData(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final Map<String, dynamic> responseData = {
      "total": "25369",
      "page": page,
      "pages": 1269,
      "tv_shows": [
        {
          "id": 35624,
          "name": "The Flash",
          "permalink": "the-flash",
          "start_date": "2014-10-07",
          "end_date": null,
          "country": "US",
          "network": "The CW",
          "status": "Ended",
          "image_thumbnail_path":
              "https://static.episodate.com/images/tv-show/thumbnail/35624.jpg",
        },
        {
          "id": 23455,
          "name": "Arrow",
          "permalink": "arrow",
          "start_date": "2012-10-10",
          "end_date": "2020-01-28",
          "country": "US",
          "network": "The CW",
          "status": "Ended",
          "image_thumbnail_path":
              "https://static.episodate.com/images/tv-show/thumbnail/23455.jpg",
        },
      ],
    };

    // Industrial standard: Parse using the Model (Data layer)
    // but return as the Entity (Domain layer).
    return TvShowListModel.fromJson(responseData);
  }
}
