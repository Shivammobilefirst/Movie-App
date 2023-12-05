import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/models/status.dart';
import 'package:movie_app/core/styles/app_text_theme.dart';
import 'package:movie_app/features/favrouite_page/bloc/favrouite_movie_bloc.dart';
import 'package:movie_app/features/home_page/model/popular_movie_model/popular_movie_model.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widget/status_dialogues.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.movie});
  bool isfav = false;
  late bool isDarkTheme;
  Utils utils = Utils();

  final PopularMovieModel movie;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = utils.checkIsDarkTheme(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: SizedBox(
                  height: 0.7.sh,
                  width: double.infinity,
                  child: Image.network(
                    '${EndPoints.imagePath}${movie.backdropPath}',
                    // alignment: Alignment.topCenter,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            movie.originalTitle.toString(),
                            style: appTextTheme.headlineSmall!.copyWith(
                                color:
                                    isDarkTheme ? Colors.white : Colors.black),
                          ),
                        ),
                        Card(
                          shadowColor: Colors.deepPurpleAccent,
                          color: Colors.black,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  '${movie.voteAverage.toString()}/10',
                                  style: appTextTheme.titleSmall
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Overview",
                      style: appTextTheme.titleMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          color: Colors.red,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                    ),
                    Text(
                      movie.overview.toString(),
                      style: appTextTheme.titleMedium!.copyWith(
                          color: isDarkTheme ? Colors.white : Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 0.62.sh,
              right: 0.05.sw,
              child: BlocConsumer<FavoriteMovieBloc, FavrouiteMovieState>(
                listener: (context, state) {
                  if (state.status.isInProgress) {
                    showProgressDialogue(context);
                  } else if (state.status.isLoaded) {
                    Navigator.pop(context);
                    isfav = true;
                  }
                },
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {},
                    icon: GestureDetector(
                      onTap: () {
                        print(movie.id);
                        context
                            .read<FavoriteMovieBloc>()
                            .add(AddFavoriteEvent(movieId: movie.id!));
                      },
                      child: Icon(
                        isfav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.pink,
                        size: 30,
                      ),
                    ),
                  );
                },
              )),
          Positioned(
            top: 30,
            left: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 30,
                width: 30,
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
