import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Sunday
  final sunday = DateTime(2025, 1, 5);
  // Monday
  final monday = DateTime(2025, 1, 6);

  MovieDetails makeMovie({required int budget, required int revenue}) =>
      MovieDetails(id: 1, title: 'Test Movie', budget: budget, revenue: revenue);

  group('profit', () {
    test('returns revenue minus budget', () {
      final movie = makeMovie(budget: 1000000, revenue: 3500000);
      expect(movie.profit, 2500000);
    });

    test('is zero when revenue equals budget', () {
      final movie = makeMovie(budget: 2000000, revenue: 2000000);
      expect(movie.profit, 0);
    });

    test('is negative when revenue is less than budget', () {
      final movie = makeMovie(budget: 5000000, revenue: 1000000);
      expect(movie.profit, -4000000);
    });
  });

  group('shouldWatchOn', () {
    test('returns true on Sunday when profit is greater than \$1,000,000', () {
      final movie = makeMovie(budget: 1000000, revenue: 2000001);
      expect(movie.shouldWatchOn(sunday), true);
    });

    test('returns false on Sunday when profit equals exactly \$1,000,000', () {
      final movie = makeMovie(budget: 1000000, revenue: 2000000);
      expect(movie.shouldWatchOn(sunday), false);
    });

    test('returns false on Sunday when profit is less than \$1,000,000', () {
      final movie = makeMovie(budget: 1000000, revenue: 1500000);
      expect(movie.shouldWatchOn(sunday), false);
    });

    test('returns false on Sunday when profit is negative', () {
      final movie = makeMovie(budget: 5000000, revenue: 1000000);
      expect(movie.shouldWatchOn(sunday), false);
    });

    test('returns false on a weekday even when profit is greater than \$1,000,000', () {
      final movie = makeMovie(budget: 1000000, revenue: 5000000);
      expect(movie.shouldWatchOn(monday), false);
    });

    test('returns false on every weekday', () {
      final movie = makeMovie(budget: 1000000, revenue: 5000000);
      // Monday through Saturday (weekdays 1–6)
      for (int day = 1; day <= 6; day++) {
        final date = DateTime(2025, 1, day + 5); // Jan 6–11 = Mon–Sat
        expect(movie.shouldWatchOn(date), false, reason: 'weekday $day should return false');
      }
    });
  });
}
