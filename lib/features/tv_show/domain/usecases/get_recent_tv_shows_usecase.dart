import 'package:movie_app_bloc/core/usecase/usecase.dart';

import '../entities/tv_show_list_entity.dart';
import '../repository/tv_show_repository.dart';

class GetRecentTvShowsUseCase implements UseCase<TvShowListEntity, int> {
  final TvShowRepository repository;

  GetRecentTvShowsUseCase(this.repository);

  @override
  Future<TvShowListEntity> call(int params) async {
    return await repository.fetchRecentTvShows(page: params);
  }
}
