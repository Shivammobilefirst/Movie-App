part of 'theme_bloc_bloc.dart';

abstract class ThemEvent extends Equatable {
  const ThemEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemEvent {
  final AppTheme theme;

  const ThemeChanged({required this.theme});
  @override
  List<Object> get props => [theme];
}
