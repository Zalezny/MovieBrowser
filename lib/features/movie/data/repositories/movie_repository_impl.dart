import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/data/datasources/movie_api_service.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService _apiService;

  MovieRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final result = await _apiService.searchMovies(dotenv.env['API_KEY'] ?? '',query);
      return right(result.results.map((dto) => dto.toEntity()).toList());
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }
}
