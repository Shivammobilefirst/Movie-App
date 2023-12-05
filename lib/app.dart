import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/bloc/theme_bloc_bloc.dart';
import 'package:movie_app/core/styles/app_theme.dart';
import 'package:movie_app/features/favrouite_page/bloc/favrouite_movie_bloc.dart';
import 'package:movie_app/features/home_page/presentation/home_page.dart';
import 'package:movie_app/utils/utils.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final GlobalKey _key = GlobalKey();
  late bool isDarkTheme;

  @override
  void initState() {
    isDarkThemeFunction();
    super.initState();
  }

  Future isDarkThemeFunction() async {
    String? isDark = await Utils().getSecureKeysValue(key: "isDarkTheme");
    print("Mode:$isDark");
    isDarkTheme = isDark == null
        ? true
        : isDark == "true"
            ? true
            : false;
    Future.delayed(Duration.zero, () {
      print("key value :${_key.currentContext}");
      BlocProvider.of<ThemeBloc>(_key.currentContext!).add(
        ThemeChanged(
          theme: isDarkTheme ? AppTheme.dark : AppTheme.light,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteMovieBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(false),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            key: _key,
            debugShowCheckedModeBanner: false,
            title: "Movie App",
            builder: (context, child) {
              ScreenUtil.init(context);
              final mediaQuery = MediaQuery.of(context);
              return Theme(
                data: state.themData!,
                child: MediaQuery(
                  data: mediaQuery.copyWith(
                    textScaleFactor: 1,
                  ),
                  child: child!,
                ),
              );
            },
            home: const HomePageScreen(),
          );
        },
      ),
    );
  }
}
