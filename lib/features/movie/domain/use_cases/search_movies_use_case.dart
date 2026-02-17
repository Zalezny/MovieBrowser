import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchMoviesUseCase {
  final MovieRepository _repository;

  SearchMoviesUseCase(this._repository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    final result = await _repository.searchMovies(query);
    return result.map(
      (movies) => movies..sort((a, b) => b.voteAverage.compareTo(a.voteAverage)),
    );
  }
}
