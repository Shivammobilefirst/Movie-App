// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'popular_movie_bloc.dart';

class PopularMovieState extends Equatable {
  const PopularMovieState({
    this.popularMovieModel,
    this.status = Status.initial,
    this.message = "",
  });

  final PopularMovieModel? popularMovieModel;
  final Status status;
  final String message;

  @override
  List<Object?> get props => [
        popularMovieModel,
        status,
        message,
      ];

  PopularMovieState copyWith({
    PopularMovieModel? popularMovieModel,
    Status? status,
    String? message,
  }) {
    return PopularMovieState(
      popularMovieModel: popularMovieModel ?? this.popularMovieModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
