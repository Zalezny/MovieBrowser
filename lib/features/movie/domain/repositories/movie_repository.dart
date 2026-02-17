import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
}
