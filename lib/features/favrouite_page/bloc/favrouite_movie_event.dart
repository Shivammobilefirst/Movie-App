// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favrouite_movie_bloc.dart';

abstract class FavrouiteMovieEvent extends Equatable {
  const FavrouiteMovieEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteMovieEvent extends FavrouiteMovieEvent {}

class AddFavoriteEvent extends FavrouiteMovieEvent {
  final int movieId;
  const AddFavoriteEvent({
    required this.movieId,
  });
}
