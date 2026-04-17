import 'package:movie_app_bloc/core/usecase/usecase.dart';
import 'package:movie_app_bloc/features/tv_show/domain/entities/tv_show_list_entity.dart';
import 'package:movie_app_bloc/features/tv_show/domain/repository/tv_show_repository.dart';

class GetPopularTvShowsUseCase implements UseCase<TvShowListEntity, int> {
  final TvShowRepository repository;

  GetPopularTvShowsUseCase(this.repository);

  @override
  Future<TvShowListEntity> call(int params) async {
    return await repository.fetchPopularTvShows(page: params);
  }
}
