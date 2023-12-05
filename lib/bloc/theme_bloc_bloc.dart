import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/styles/app_theme.dart';

part 'theme_bloc_event.dart';
part 'theme_bloc_state.dart';

class ThemeBloc extends Bloc<ThemEvent, ThemeState> {
  final bool isDarkTheme;
  ThemeBloc(this.isDarkTheme)
      : super(ThemeState(
            themData:
                appThemeData[isDarkTheme ? AppTheme.dark : AppTheme.light])) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(themData: appThemeData[event.theme]));
    });
  }
}
