import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/domain/repositories/movie_repository.dart';
import 'package:flutter_recruitment_task/features/movie/domain/use_cases/search_movies_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late _MockMovieRepository mockRepository;
  late SearchMoviesUseCase useCase;

  setUp(() {
    mockRepository = _MockMovieRepository();
    useCase = SearchMoviesUseCase(mockRepository);
  });

  group('SearchMoviesUseCase sorting', () {
    test('returns movies sorted by vote average descending', () async {
      when(() => mockRepository.searchMovies(any())).thenAnswer(
        (_) async => right([
          const Movie(id: 1, title: 'Movie A', voteAverage: 6.0),
          const Movie(id: 2, title: 'Movie B', voteAverage: 9.0),
          const Movie(id: 3, title: 'Movie C', voteAverage: 7.5),
        ]),
      );

      final result = await useCase('query');

      result.fold(
        (_) => fail('Expected Right'),
        (movies) {
          expect(movies.map((m) => m.voteAverage).toList(), [9.0, 7.5, 6.0]);
        },
      );
    });
  });
}
