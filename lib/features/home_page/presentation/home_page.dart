import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/bloc/theme_bloc_bloc.dart';
import 'package:movie_app/core/constants/app_sizes.dart';
import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/data/secure_storage.dart';
import 'package:movie_app/core/models/status.dart';
import 'package:movie_app/core/styles/app_text_theme.dart';
import 'package:movie_app/core/styles/app_theme.dart';
import 'package:movie_app/features/favrouite_page/presentation/fav_page.dart';
import 'package:movie_app/features/home_page/bloc/popular_movie_bloc.dart';
import 'package:movie_app/features/home_page/presentation/detail_screen.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widget/status_dialogues.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopularMovieBloc(),
        ),
      ],
      child: const HomePageScreenBody(),
    );
  }
}

class HomePageScreenBody extends StatefulWidget {
  const HomePageScreenBody({super.key});

  @override
  State<HomePageScreenBody> createState() => _HomePageScreenBodyState();
}

class _HomePageScreenBodyState extends State<HomePageScreenBody> {
  bool isMode = true;
  final SecureStorage _secureStorage = SecureStorage();
  late bool isDarkTheme;
  //for use utils
  Utils utils = Utils();
  @override
  void initState() {
    context.read<PopularMovieBloc>().add(PopularMovieRequested());
    context.read<PopularMovieBloc>().add(UpcomingMovieRequested());
    context.read<PopularMovieBloc>().add(TopRatedMoviesRequested());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = utils.checkIsDarkTheme(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FavoritePageScreen();
                }));
              },
              icon: const Icon(Icons.favorite_border)),
          IconButton(
              onPressed: () {
                setState(() {
                  isMode = !isMode; // Toggle the dark mode
                });

                context.read<ThemeBloc>().add(ThemeChanged(
                      theme: isMode ? AppTheme.dark : AppTheme.light,
                    ));
                _secureStorage.secureWrite(
                    key: "isDarkTheme", value: isMode.toString());
              },
              icon: Icon(isMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
        title: Text(
          "Movies",
          style: appTextTheme.headlineMedium!.copyWith(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: <Color>[
                    Colors.pinkAccent,
                    Colors.deepPurpleAccent,
                    Colors.red
                    //add more color here.
                  ],
                ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.large),
          child: BlocConsumer<PopularMovieBloc, PopularMovieState>(
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
              if (state.popularMovieModel == null ||
                  state.upcomingMovieModel == null ||
                  state.topRatedMovieModel == null) {
                return const Text("Value is NUll");
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Movie",
                      style: appTextTheme.titleMedium!.copyWith(
                          color: isMode ? Colors.white : Colors.black),
                    ),
                    SizedBox(
                      height: 0.35.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.popularMovieModel!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailScreen(
                                      movie: state.popularMovieModel![index]);
                                }));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox(
                                  width: 0.4.sw,
                                  child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${EndPoints.imagePath}${state.popularMovieModel![index].posterPath}',
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.small,
                    ),
                    Text(
                      "Upcoming Movies",
                      style: appTextTheme.titleMedium!.copyWith(
                          color: isMode ? Colors.white : Colors.black),
                    ),
                    SizedBox(
                      height: 0.35.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.upcomingMovieModel!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    movie: state.upcomingMovieModel![index],
                                  ),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox(
                                  width: 0.4.sw,
                                  child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${EndPoints.imagePath}${state.upcomingMovieModel![index].posterPath}',
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "Top rated movies",
                      style: appTextTheme.titleMedium!.copyWith(
                          color: isMode ? Colors.white : Colors.black),
                    ),
                    SizedBox(
                      height: 0.35.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.upcomingMovieModel!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    movie: state.topRatedMovieModel![index],
                                  ),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox(
                                  width: 0.4.sw,
                                  child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${EndPoints.imagePath}${state.topRatedMovieModel![index].posterPath}',
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
