import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_bloc/core/response/api_response.dart';
import 'package:movie_app_bloc/core/services/services_locator.dart';
import 'package:movie_app_bloc/features/movies/data/models/movie_list_model.dart';
import 'package:movie_app_bloc/features/movies/data/repository/movies_repository.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesApiRepository moviesApiRepository = getIt<MoviesApiRepository>();
  MoviesBloc()
    : super(
        MoviesState(
          popularMoviesList: const ApiResponse.loading(),
          recentMoviesList: const ApiResponse.loading(),
        ),
      ) {
    on<PopularMoviesFetched>((event, emit) async {
      emit(state.copyWith(popularMoviesList: const ApiResponse.loading()));
      try {
        final movies = await moviesApiRepository.fetchPopularMoviesList(
          page: state.page,
        );
        emit(state.copyWith(popularMoviesList: ApiResponse.completed(movies)));
      } catch (e) {
        emit(
          state.copyWith(popularMoviesList: ApiResponse.error(e.toString())),
        );
      }
    });

    on<PageChange>((event, emit) async {
      emit(state.copyWith(page: event.page));
    });

    on<PageIncremented>((event, emit) async {
      emit(state.copyWith(page: state.page + 1));
    });

    on<PageDecremental>((event, emit) async {
      if (state.page > 1) {
        emit(state.copyWith(page: state.page - 1));
      }
    });
  }
}
