import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
// dio instance
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = EndPoints.baseurl
      // ..options.connectTimeout = EndPoints.connectionTimeout as Duration?
      // ..options.receiveTimeout = Endpoints.receiveTimeout
      ..interceptors.add(PrettyDioLogger());
  }

  // Get:--------------------------------------------------------------
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    try {
      return _dio.get<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on SocketException {
      throw const SocketException('No internet, Check your connection');
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }
}
