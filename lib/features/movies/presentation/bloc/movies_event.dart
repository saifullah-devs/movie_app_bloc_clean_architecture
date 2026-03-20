part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class PopularMoviesFetched extends MoviesEvent {}

class RecentMoviesFetched extends MoviesEvent {}

class PageChange extends MoviesEvent {
  final int page;
  const PageChange({this.page = 0});
}

class PageIncremented extends MoviesEvent {}

class PageDecremental extends MoviesEvent {}
