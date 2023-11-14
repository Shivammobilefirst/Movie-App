part of 'popular_movie_bloc.dart';

abstract class PopularMovieEvent extends Equatable {
  const PopularMovieEvent();

  @override
  List<Object> get props => [];
}

class PopularMovieRequested extends PopularMovieEvent {}

class UpcomingMovieRequested extends PopularMovieEvent {}

class TopRatedMoviesRequested extends PopularMovieEvent {}
