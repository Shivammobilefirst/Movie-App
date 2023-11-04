import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/styles/app_text_theme.dart';
import 'package:movie_app/core/styles/app_theme.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie App",
      theme: AppTheme.lightTheme,
      builder: (context, child) {
        ScreenUtil.init(context);
        final mediaQuery = MediaQuery.of(context);
        return Theme(
          data: AppTheme.lightTheme.copyWith(
            textTheme: appTextTheme,
          ),
          child: MediaQuery(
            data: mediaQuery.copyWith(
              textScaleFactor: 1,
            ),
            child: child!,
          ),
        );
      },
      home: const Scaffold(),
    );
  }
}
