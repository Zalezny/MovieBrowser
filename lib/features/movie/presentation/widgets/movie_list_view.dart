import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/widgets/movie_card.dart';
import 'package:flutter_recruitment_task/shared/utils/number_formatters.dart';
import 'package:flutter_recruitment_task/shared/widgets/list_divider.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movies;

  const MovieListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) => ListView.separated(
        separatorBuilder: (_, __) => const ListDivider(),
        itemBuilder: (context, index) => MovieCard(
          key: ValueKey(movies[index].id),
          title: movies[index].title,
          rating: movies[index].voteAverage.toRatingPercent(),
          onTap: () {},
        ),
        itemCount: movies.length,
      );
}
