part of 'theme_bloc_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData? themData;

  const ThemeState({required this.themData});
  @override
  List<Object> get props => [themData!];
}
