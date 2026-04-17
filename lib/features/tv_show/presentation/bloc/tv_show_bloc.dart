import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_bloc/core/response/api_response.dart';
import 'package:movie_app_bloc/features/tv_show/domain/entities/tv_show_list_entity.dart';
import 'package:movie_app_bloc/features/tv_show/domain/usecases/get_popular_tv_shows_usecase.dart';
import 'package:movie_app_bloc/features/tv_show/domain/usecases/get_recent_tv_shows_usecase.dart';

part 'tv_show_event.dart';
part 'tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  final GetPopularTvShowsUseCase _getPopularTvShowsUseCase;
  final GetRecentTvShowsUseCase _getRecentTvShowsUseCase;

  TvShowBloc({
    required GetPopularTvShowsUseCase popularUseCase,
    required GetRecentTvShowsUseCase recentUseCase,
  }) : _getPopularTvShowsUseCase = popularUseCase,
       _getRecentTvShowsUseCase = recentUseCase,
       super(const TvShowState()) {
    on<FetchPopularTvShows>(_onFetchPopular);
    on<FetchRecentTvShows>(_onFetchRecent);
    on<PageChanged>(_onPageChanged);
  }

  Future<void> _onFetchPopular(
    FetchPopularTvShows event,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(popularTvShows: const ApiResponse.loading()));

    try {
      // Calling UseCase as a function thanks to the 'call' method
      final result = await _getPopularTvShowsUseCase(state.page);
      emit(state.copyWith(popularTvShows: ApiResponse.completed(result)));
    } catch (e) {
      emit(state.copyWith(popularTvShows: ApiResponse.error(e.toString())));
    }
  }

  Future<void> _onFetchRecent(
    FetchRecentTvShows event,
    Emitter<TvShowState> emit,
  ) async {
    emit(state.copyWith(recentTvShows: const ApiResponse.loading()));

    try {
      final result = await _getRecentTvShowsUseCase(state.page);
      emit(state.copyWith(recentTvShows: ApiResponse.completed(result)));
    } catch (e) {
      emit(state.copyWith(recentTvShows: ApiResponse.error(e.toString())));
    }
  }

  void _onPageChanged(PageChanged event, Emitter<TvShowState> emit) {
    if (event.page > 0) {
      emit(state.copyWith(page: event.page));
      add(FetchPopularTvShows());
    }
  }
}
