// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'popular_movie_bloc.dart';

class PopularMovieState extends Equatable {
  const PopularMovieState({
    this.popularMovieModel,
    this.upcomingMovieModel,
    this.topRatedMovieModel,
    this.status = Status.initial,
    this.message = "",
  });

  final List<PopularMovieModel>? popularMovieModel;
  final List<PopularMovieModel>? upcomingMovieModel;
  final List<PopularMovieModel>? topRatedMovieModel;
  final Status status;
  final String message;

  @override
  List<Object?> get props => [
        popularMovieModel,
        status,
        message,
        upcomingMovieModel,
        topRatedMovieModel,
      ];

  PopularMovieState copyWith({
    List<PopularMovieModel>? popularMovieModel,
    List<PopularMovieModel>? upcomingMovieModel,
    List<PopularMovieModel>? topRatedMovieModel,
    Status? status,
    String? message,
  }) {
    return PopularMovieState(
      popularMovieModel: popularMovieModel ?? this.popularMovieModel,
      upcomingMovieModel: upcomingMovieModel ?? this.upcomingMovieModel,
      topRatedMovieModel: topRatedMovieModel ?? this.topRatedMovieModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
