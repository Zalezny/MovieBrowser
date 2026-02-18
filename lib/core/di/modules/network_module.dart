import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_recruitment_task/core/config/app_config.dart';
import 'package:flutter_recruitment_task/features/movie/data/datasources/movie_api_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  AppConfig get appConfig => AppConfig(
        apiKey: dotenv.env['API_KEY'] ?? '',
        baseUrl: dotenv.env['BASE_URL'] ?? '',
      );

  @lazySingleton
  Dio dio(AppConfig config) => Dio(
        BaseOptions(
          baseUrl: config.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

  @lazySingleton
  MovieApiService movieApiService(Dio dio) => MovieApiService(dio);
}
