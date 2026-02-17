import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_recruitment_task/core/di/injection.dart';
import 'package:flutter_recruitment_task/features/movie/data/datasources/movie_api_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: dotenv.env['BASE_URL'] ?? '',
        ),
      );

  @lazySingleton
  MovieApiService get movieApiService => MovieApiService(getIt());
}
