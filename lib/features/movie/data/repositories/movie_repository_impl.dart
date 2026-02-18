import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/core/config/app_config.dart';
import 'package:flutter_recruitment_task/core/data/dio_exception_mapper.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/data/datasources/movie_api_service.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_details.dart';
import 'package:flutter_recruitment_task/features/movie/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService _apiService;
  final AppConfig _config;

  MovieRepositoryImpl(this._apiService, this._config);

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final result = await _apiService.searchMovies(_config.apiKey, query);
      return right(result.results.map((dto) => dto.toEntity()).toList());
    } on DioException catch (e) {
      return left(DioExceptionMapper.mapToFailure(e));
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) async {
    try {
      final result = await _apiService.getMovieDetails(id, _config.apiKey);
      return right(result.toEntity());
    } on DioException catch (e) {
      return left(DioExceptionMapper.mapToFailure(e));
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }
}
