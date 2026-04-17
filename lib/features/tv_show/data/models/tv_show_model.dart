import '../../domain/entities/tv_show_entity.dart';

class TvShowModel extends TvShowEntity {
  const TvShowModel({
    super.id,
    super.name,
    super.permalink,
    super.startDate,
    super.endDate,
    super.country,
    super.network,
    super.status,
    super.imageThumbnailPath,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      permalink: json['permalink'] as String? ?? '',
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      country: json['country'] as String? ?? '',
      network: json['network'] as String?,
      status: json['status'] as String? ?? '',
      imageThumbnailPath: json['image_thumbnail_path'] as String? ?? '',
    );
  }
}
