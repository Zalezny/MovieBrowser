import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_details.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id);
}
