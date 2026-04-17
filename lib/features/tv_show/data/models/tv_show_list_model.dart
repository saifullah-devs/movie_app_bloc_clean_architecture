import '../../domain/entities/tv_show_list_entity.dart';
import 'tv_show_model.dart';

class TvShowListModel extends TvShowListEntity {
  const TvShowListModel({super.total, super.page, super.pages, super.tvShows});

  factory TvShowListModel.fromJson(Map<String, dynamic> json) {
    return TvShowListModel(
      total: int.tryParse(json['total']?.toString() ?? '0') ?? 0,
      page: json['page'] as int? ?? 1,
      pages: json['pages'] as int? ?? 0,
      tvShows: (json['tv_shows'] as List? ?? [])
          .map((e) => TvShowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
