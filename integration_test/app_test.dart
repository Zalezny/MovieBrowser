import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_recruitment_task/core/di/injection.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_details.dart';
import 'package:flutter_recruitment_task/features/movie/domain/repositories/movie_repository.dart';
import 'package:flutter_recruitment_task/movie_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

class _FakeMovieRepository implements MovieRepository {
  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async => right([
        const Movie(id: 1, title: 'Batman Begins', voteAverage: 8.3),
        const Movie(id: 2, title: 'The Dark Knight', voteAverage: 9.0),
      ]);

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) async => right(
        MovieDetails(
          id: id,
          title: 'The Dark Knight',
          budget: 185000000,
          revenue: 1004558444,
        ),
      );
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    dotenv.testLoad(fileInput: 'API_KEY=test_key\nBASE_URL=https://api.themoviedb.org');
    await configureDependencies();
    getIt.allowReassignment = true;
    getIt.registerLazySingleton<MovieRepository>(() => _FakeMovieRepository());
  });

  testWidgets('search shows movies and tapping opens details page', (tester) async {
    await tester.pumpWidget(const MovieApp());
    await tester.pumpAndSettle();

    // Movie list page is shown with search box
    expect(find.text('Movie Browser'), findsOneWidget);
    expect(find.bySemanticsLabel('Search...'), findsNothing);
    expect(find.byTooltip('Search...'), findsNothing);

    // Enter a search query and submit
    await tester.enterText(find.byType(TextField).first, 'Batman');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle();

    // Movies are displayed
    expect(find.text('Batman Begins'), findsOneWidget);
    expect(find.text('The Dark Knight'), findsOneWidget);

    // Tap the first movie to navigate to details
    await tester.tap(find.text('Batman Begins'));
    await tester.pumpAndSettle();

    // Details page is shown with the movie title in the AppBar
    expect(find.text('The Dark Knight'), findsWidgets);
    expect(find.text('Budget'), findsOneWidget);
    expect(find.text('Revenue'), findsOneWidget);
    expect(find.text('Should I watch it today?'), findsOneWidget);
  });
}
