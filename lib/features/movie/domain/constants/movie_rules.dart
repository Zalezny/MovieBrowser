// Business rules and constants for movie recommendations.
class MovieRules {
  MovieRules._();

  // Minimum profit (in dollars) required for a movie to be recommended.
  static const int minProfitForRecommendation = 1000000;

  // Day of the week when movies should be watched (Sunday = 7).
  static const int recommendedWatchDay = DateTime.sunday;
}
