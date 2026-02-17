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
      date.weekday == DateTime.sunday && profit > 1000000;

  bool get shouldWatchToday => shouldWatchOn(DateTime.now());
}
