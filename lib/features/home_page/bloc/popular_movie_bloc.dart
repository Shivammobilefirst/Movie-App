import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/models/status.dart';
import 'package:movie_app/features/home_page/data/popular_movie_repository.dart';
import 'package:movie_app/features/home_page/model/popular_movie_model/popular_movie_model.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  PopularMovieBloc() : super(const PopularMovieState()) {
    on<PopularMovieEvent>(popularMovieEvent);
  }

  PopularMovieRepository popularMovieRepository = PopularMovieRepository();

  FutureOr<void> popularMovieEvent(
      PopularMovieEvent event, Emitter<PopularMovieState> emit) async {
    emit(const PopularMovieState().copyWith(status: Status.inProgress));
    final apiResult = await popularMovieRepository.getPopularMovie();
    apiResult.when(
      success: (user) async {
        emit(state.copyWith(
          status: Status.loaded,
          popularMovieModel: user,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
          status: Status.failed,
          message: error,
        ));
      },
    );
  }
}
