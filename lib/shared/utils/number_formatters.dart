extension VoteAverageFormatter on double {
  String toRatingPercent() => '${(this * 10).toInt()}%';
}

extension DollarFormatter on int {
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