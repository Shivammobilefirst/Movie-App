import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/app_sizes.dart';
import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/models/status.dart';
import 'package:movie_app/core/styles/app_text_theme.dart';
import 'package:movie_app/features/favrouite_page/bloc/favrouite_movie_bloc.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widget/status_dialogues.dart';

class FavoritePageScreen extends StatelessWidget {
  const FavoritePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteMovieBloc(),
      child: const FavoritePageBody(),
    );
  }
}

class FavoritePageBody extends StatefulWidget {
  const FavoritePageBody({super.key});

  @override
  State<FavoritePageBody> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePageBody> {
  late bool isDarkTheme;
  Utils utils = Utils();
  @override
  void initState() {
    context.read<FavoriteMovieBloc>().add(GetFavoriteMovieEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = utils.checkIsDarkTheme(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<FavoriteMovieBloc, FavrouiteMovieState>(
        listener: (context, state) {
          if (state.status.isInProgress) {
            showProgressDialogue(context);
          } else {
            if (isProgressDialogShowing) {
              isProgressDialogShowing = false;
              Navigator.of(context).pop();
            }
            if (state.status.isFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              // Text("error: ${state.message}");
            }
          }
        },
        builder: (context, state) {
          if (state.favMovieModel == null) {
            return const Text("Value is NUll");
          }
          return ListView.builder(
              itemCount: state.favMovieModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 1,
                  color: Colors.white24,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            filterQuality: FilterQuality.high,
                            width: 0.4.sw,
                            height: 0.3.sh,
                            fit: BoxFit.cover,
                            '${EndPoints.imagePath}${state.favMovieModel![index].posterPath}',
                          ),
                        ),
                        gapWMedium,
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  state.favMovieModel![index].originalTitle
                                      .toString(),
                                  style: appTextTheme.headlineLarge?.copyWith(
                                      color: isDarkTheme
                                          ? Colors.white
                                          : Colors.black)),
                              Text(
                                  "(${state.favMovieModel![index].releaseDate.toString()})",
                                  style: appTextTheme.headlineSmall?.copyWith(
                                      fontSize: 15
                                      
                                      .sp,
                                      color: isDarkTheme
                                          ? Colors.white
                                          : Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
