extension VoteAverageFormatter on double {
  /// Converts a TMDB vote average (0–10) to a percentage string, e.g. `"74%"`.
  String toRatingPercent() => '${(this * 10).toInt()}%';
}

extension DollarFormatter on int {
  /// Formats an integer as a dollar string with thousands separators, e.g. `"$2,400,000"`.
  String toDollarFormat() {
    final str = abs().toString();
    final buffer = StringBuffer(this < 0 ? '-\$' : '\$');
    final offset = str.length % 3;
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (i - offset) % 3 == 0) buffer.write(',');
      buffer.write(str[i]);
    }
    return buffer.toString();
  }
}
