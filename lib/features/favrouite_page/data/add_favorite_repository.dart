import 'dart:convert';

import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/data/dio_client.dart';
import 'package:movie_app/core/models/api_result/api_result.dart';
import 'package:movie_app/core/models/network_exception/network_exceptions.dart';
import 'package:movie_app/features/home_page/model/popular_movie_model/popular_movie_model.dart';

class AddFavoriteRepository {
  final DioClient _client = DioClient();

  Future<ApiResult<bool>> addtoFavourite(int movieId) async {
    try {
      final response = await _client.post(
        EndPoints.addFavoriteMovie,
        data: {
          "media_type": "movie",
          "media_id": movieId,
          "favorite": true,
        },
      );
      return const ApiResult.success(true);
    } on Exception catch (error, _) {
      return ApiResult.failure(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<ApiResult<List<PopularMovieModel>>> getPopularMovie() async {
    try {
      final response = await _client.get<String>(
        EndPoints.favoriteMovie,
      );
      final jsonData = jsonDecode(response.data!) as Map<String, dynamic>;
      final result = jsonData["results"] as List;
      print("results 1:- $result");
      return ApiResult.success(
          result.map((e) => PopularMovieModel.fromJson(e)).toList());
    } on Exception catch (error, _) {
      return ApiResult.failure(NetworkExceptions.getErrorMessage(error));
    }
  }
}
