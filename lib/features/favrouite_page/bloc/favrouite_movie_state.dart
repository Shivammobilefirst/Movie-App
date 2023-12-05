// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favrouite_movie_bloc.dart';

class FavrouiteMovieState extends Equatable {
  const FavrouiteMovieState({
    this.favMovieModel,
    this.status = Status.initial,
    this.message = "",
    this.success,
  });

  final List<PopularMovieModel>? favMovieModel;

  final Status status;
  final String message;
  final bool? success;

  @override
  List<Object?> get props => [status, message, success, favMovieModel];

  FavrouiteMovieState copyWith({
    List<PopularMovieModel>? favMovieModel,
    Status? status,
    String? message,
    bool? success,
  }) {
    return FavrouiteMovieState(
      favMovieModel: favMovieModel ?? this.favMovieModel,
      status: status ?? this.status,
      message: message ?? this.message,
      success: success ?? this.success,
    );
  }
}
