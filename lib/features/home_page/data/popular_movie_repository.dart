import 'dart:convert';

import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/data/dio_client.dart';
import 'package:movie_app/core/models/api_result/api_result.dart';
import 'package:movie_app/core/models/network_exception/network_exceptions.dart';
import 'package:movie_app/features/home_page/model/popular_movie_model/popular_movie_model.dart';

class PopularMovieRepository {
  final DioClient _client = DioClient();

  PopularMovieRepository();

  Future<ApiResult<List<PopularMovieModel>>> getPopularMovie() async {
    try {
      final response = await _client.get<String>(
        EndPoints.getPopularMovie,
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

  Future<ApiResult<List<PopularMovieModel>>> upcomingMovie() async {
    try {
      final response = await _client.get<String>(
        EndPoints.upcomingMovie,
      );
      final jsonData = jsonDecode(response.data!) as Map<String, dynamic>;
      final result = jsonData["results"] as List;
      print("results  2:- $result");
      return ApiResult.success(
          result.map((e) => PopularMovieModel.fromJson(e)).toList());
    } on Exception catch (error, _) {
      return ApiResult.failure(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<ApiResult<List<PopularMovieModel>>> topRatedMovie() async {
    try {
      final response = await _client.get<String>(
        EndPoints.topRatedMovie,
      );
      final jsonData = jsonDecode(response.data!) as Map<String, dynamic>;
      final result = jsonData["results"] as List;
      print("results  3:- $result");
      return ApiResult.success(
          result.map((e) => PopularMovieModel.fromJson(e)).toList());
    } on Exception catch (error, _) {
      return ApiResult.failure(NetworkExceptions.getErrorMessage(error));
    }
  }
}
