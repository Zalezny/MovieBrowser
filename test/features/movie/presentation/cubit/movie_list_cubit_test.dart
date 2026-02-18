import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/domain/use_cases/search_movies_use_case.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_list_cubit.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_list_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSearchMoviesUseCase extends Mock implements SearchMoviesUseCase {}

void main() {
  late _MockSearchMoviesUseCase mockUseCase;

  setUp(() {
    mockUseCase = _MockSearchMoviesUseCase();
  });

  group('MovieListCubit', () {
    blocTest<MovieListCubit, MovieListState>(
      'emits (loading, success) when searchMovies returns movies',
      build: () {
        when(() => mockUseCase(any())).thenAnswer(
          (_) async => right([
            const Movie(id: 1, title: 'Batman', voteAverage: 8.5),
            const Movie(id: 2, title: 'Batman Returns', voteAverage: 7.9),
          ]),
        );
        return MovieListCubit(mockUseCase);
      },
      act: (cubit) => cubit.searchMovies('Batman'),
      expect: () => [
        const MovieListState.loading(),
        isA<MovieListState>().having(
          (s) => s.maybeWhen(success: (movies) => movies.length, orElse: () => null),
          'movies count',
          2,
        ),
      ],
    );

    blocTest<MovieListCubit, MovieListState>(
      'emits (loading, failure) when searchMovies returns a failure',
      build: () {
        when(() => mockUseCase(any())).thenAnswer(
          (_) async => left(const ServerFailure('Network error')),
        );
        return MovieListCubit(mockUseCase);
      },
      act: (cubit) => cubit.searchMovies('Batman'),
      expect: () => [
        const MovieListState.loading(),
        const MovieListState.failure('Network error'),
      ],
    );

    blocTest<MovieListCubit, MovieListState>(
      'emits [initial] and does not call use case when query is empty',
      build: () => MovieListCubit(mockUseCase),
      act: (cubit) => cubit.searchMovies(''),
      expect: () => [const MovieListState.initial()],
      verify: (_) => verifyNever(() => mockUseCase(any())),
    );
  });
}
