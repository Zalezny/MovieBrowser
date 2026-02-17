import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final result = await _dataSource.searchMovies(query);
      return right(result.results.map((dto) => dto.toEntity()).toList());
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }
}
