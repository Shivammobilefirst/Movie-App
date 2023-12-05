import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/models/status.dart';
import 'package:movie_app/features/favrouite_page/data/add_favorite_repository.dart';
import 'package:movie_app/features/home_page/model/popular_movie_model/popular_movie_model.dart';

part 'favrouite_movie_event.dart';
part 'favrouite_movie_state.dart';

class FavoriteMovieBloc extends Bloc<FavrouiteMovieEvent, FavrouiteMovieState> {
  FavoriteMovieBloc() : super(const FavrouiteMovieState()) {
    on<GetFavoriteMovieEvent>(getFavoriteMovieEvent);
    on<AddFavoriteEvent>(addFavoriteEvent);
  }

  AddFavoriteRepository addFavoriteRepository = AddFavoriteRepository();

  FutureOr<void> addFavoriteEvent(
      AddFavoriteEvent event, Emitter<FavrouiteMovieState> emit) async {
    emit(state.copyWith(status: Status.inProgress));
    final apiResult = await addFavoriteRepository.addtoFavourite(event.movieId);
    apiResult.when(
      success: (user) async {
        emit(state.copyWith(
          status: Status.loaded,
          success: user,
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

  FutureOr<void> getFavoriteMovieEvent(
      GetFavoriteMovieEvent event, Emitter<FavrouiteMovieState> emit) async {
    emit(state.copyWith(status: Status.inProgress));
    final apiResult = await addFavoriteRepository.getPopularMovie();
    apiResult.when(success: (user) async {
      emit(state.copyWith(
        status: Status.loaded,
        favMovieModel: user,
      ));
    }, failure: (error) {
      emit(state.copyWith(
        status: Status.failed,
        message: error,
      ));
    });
  }
}
