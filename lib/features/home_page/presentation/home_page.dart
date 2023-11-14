import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/app_sizes.dart';
import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/models/status.dart';
import 'package:movie_app/features/home_page/bloc/popular_movie_bloc.dart';
import 'package:movie_app/widget/status_dialogues.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularMovieBloc(),
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
  @override
  void initState() {
    context.read<PopularMovieBloc>().add(PopularMovieRequested());
    context.read<PopularMovieBloc>().add(UpcomingMovieRequested());
    context.read<PopularMovieBloc>().add(TopRatedMoviesRequested());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movies",
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
                    const Text("Popular Movie"),
                    SizedBox(
                      height: 0.35.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.popularMovieModel!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                width: 0.4.sw,
                                child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  '${EndPoints.imagePath}${state.popularMovieModel![index].backdropPath}',
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
                    const Text("Upcoming Movies"),
                    SizedBox(
                      height: 0.35.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.upcomingMovieModel!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                width: 0.4.sw,
                                child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  '${EndPoints.imagePath}${state.upcomingMovieModel![index].backdropPath}',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Text("Top rated movies"),
                    SizedBox(
                      height: 0.35.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.upcomingMovieModel!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                width: 0.4.sw,
                                child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  '${EndPoints.imagePath}${state.topRatedMovieModel![index].backdropPath}',
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
