import 'package:flutter_recruitment_task/features/movie/domain/constants/movie_rules.dart';

class MovieDetails {
  final int id;
  final String title;
  final int budget;
  final int revenue;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.budget,
    required this.revenue,
  });

  int get profit => revenue - budget;

  bool shouldWatchOn(DateTime date) =>
      date.weekday == MovieRules.recommendedWatchDay &&
      profit > MovieRules.minProfitForRecommendation;

  bool get shouldWatchToday => shouldWatchOn(DateTime.now());
}
