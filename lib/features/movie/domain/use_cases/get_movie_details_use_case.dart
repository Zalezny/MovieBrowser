import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_details.dart';
import 'package:flutter_recruitment_task/features/movie/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMovieDetailsUseCase {
  final MovieRepository _repository;

  GetMovieDetailsUseCase(this._repository);

  Future<Either<Failure, MovieDetails>> call(int id) =>
      _repository.getMovieDetails(id);
}
