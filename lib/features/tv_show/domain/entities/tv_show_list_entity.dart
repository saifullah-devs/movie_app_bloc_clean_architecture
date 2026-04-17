import 'package:equatable/equatable.dart';

import 'tv_show_entity.dart';

class TvShowListEntity extends Equatable {
  final int total;
  final int page;
  final int pages;
  final List<TvShowEntity> tvShows;

  const TvShowListEntity({
    this.total = 0,
    this.page = 1,
    this.pages = 0,
    this.tvShows = const [],
  });

  @override
  List<Object?> get props => [total, page, pages, tvShows];
}
