import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/core/network/movie_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  static const _baseUrl = 'https://api.themoviedb.org';

  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

  @singleton
  MovieApiClient movieApiClient(Dio dio) => MovieApiClient(dio);
}
