import 'dart:convert';

import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/data/dio_client.dart';
import 'package:movie_app/core/models/api_result/api_result.dart';
import 'package:movie_app/core/models/network_exception/network_exceptions.dart';
import 'package:movie_app/features/home_page/model/popular_movie_model/popular_movie_model.dart';

class PopularMovieRepository {
  final DioClient _client = DioClient();

  PopularMovieRepository();

  Future<ApiResult<PopularMovieModel>> getPopularMovie() async {
    try {
      final response = await _client.get<String>(EndPoints.getPopularMovie);
      final jsonData = jsonDecode(response.data!) as Map<String, dynamic>;
      final result = jsonData["results"];
      print(result);
      return ApiResult.success(PopularMovieModel.fromJson(result));
    } on Exception catch (error, _) {
      return ApiResult.failure(NetworkExceptions.getErrorMessage(error));
    }
  }
}
