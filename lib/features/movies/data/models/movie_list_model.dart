import 'package:freezed_annotation/freezed_annotation.dart'; // Importing freezed_annotation package

part 'movie_list_model.freezed.dart'; // Importing generated code for Freezed classes
part 'movie_list_model.g.dart'; // Importing generated code for JSON serialization

/// Freezed class representing a list of movies.
@freezed
sealed class MovieListModel with _$MovieListModel {
  /// Factory constructor for creating a [MovieListModel] instance.
  factory MovieListModel({
    @Default(0) int total, // Total number of movies
    @Default(0) int page, // Current page number
    @Default(0) int pages, // Total number of pages
    @Default([])
    @JsonKey(name: 'tv_shows')
    List<TvShows> tvShow, // List of TV shows
  }) = _MovieListModel; // Constructor for the freezed class

  /// Factory constructor for creating a [MovieListModel] instance from JSON.
  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json); // JSON deserialization method
}

/// Freezed class representing a TV show.
@freezed
sealed class TvShows with _$TvShows {
  factory TvShows({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'permalink') @Default('') String permalink,

    // ✅ Made nullable (String?) because the API sometimes sends 'null'!
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,

    @JsonKey(name: 'country') @Default('') String country,
    @JsonKey(name: 'network')
    String? network, // Sometimes network can be null too!
    @JsonKey(name: 'status') @Default('') String status,

    // ✅ The Magic Fix! Freezed now knows exactly where to find the URL.
    @JsonKey(name: 'image_thumbnail_path')
    @Default('')
    String imageThumbnailPath,
  }) = _TvShows;

  factory TvShows.fromJson(Map<String, dynamic> json) =>
      _$TvShowsFromJson(json);
}
