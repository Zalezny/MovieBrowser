import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/core/router/app_router.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/widgets/movie_card.dart';
import 'package:flutter_recruitment_task/shared/utils/number_formatters.dart';
import 'package:flutter_recruitment_task/shared/widgets/list_divider.dart';
import 'package:go_router/go_router.dart';

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
          onTap: () => context.push(AppRouter.movieDetailsPath(movies[index].id)),
        ),
        itemCount: movies.length,
      );
}
