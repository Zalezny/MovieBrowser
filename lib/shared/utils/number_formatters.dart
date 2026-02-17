extension VoteAverageFormatter on double {
  /// Converts a TMDB vote average (0–10) to a percentage string, e.g. `"74%"`.
  String toRatingPercent() => '${(this * 10).toInt()}%';
}
