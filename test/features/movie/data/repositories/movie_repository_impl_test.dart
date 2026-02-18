import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/core/config/app_config.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/data/datasources/movie_api_service.dart';
import 'package:flutter_recruitment_task/features/movie/data/models/movie_dto.dart';
import 'package:flutter_recruitment_task/features/movie/data/models/movie_list_dto.dart';
import 'package:flutter_recruitment_task/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockMovieApiService extends Mock implements MovieApiService {}

void main() {
  late _MockMovieApiService mockApiService;
  late MovieRepositoryImpl repository;
  late AppConfig testConfig;

  setUp(() {
    mockApiService = _MockMovieApiService();
    testConfig = const AppConfig(apiKey: 'test_api_key', baseUrl: 'https://test.api.com');
    repository = MovieRepositoryImpl(mockApiService, testConfig);
  });

  group('searchMovies', () {
    final movieListDto = MovieListDto(
      totalResults: 1,
      results: [
        const MovieDto(id: 1, title: 'Batman', voteAverage: 8.5),
      ],
    );

    test('returns Right<List<Movie>> when API call succeeds', () async {
      when(() => mockApiService.searchMovies(any(), any())).thenAnswer((_) async => movieListDto);

      final result = await repository.searchMovies('Batman');

      expect(result, isA<Right<Failure, List<Movie>>>());
      result.fold(
        (_) => fail('Expected Right'),
        (movies) {
          expect(movies.length, 1);
          expect(movies.first.title, 'Batman');
          expect(movies.first.id, 1);
        },
      );
    });

    test('returns Left<ServerFailure> when API throws DioException', () async {
      when(() => mockApiService.searchMovies(any(), any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          message: 'Connection timeout',
        ),
      );

      final result = await repository.searchMovies('Batman');

      expect(result, isA<Left<Failure, List<Movie>>>());
      result.fold(
        (failure) {
          expect(failure, isA<ServerFailure>());
          expect(failure.message, 'Connection timeout');
        },
        (_) => fail('Expected Left'),
      );
    });
  });
}
