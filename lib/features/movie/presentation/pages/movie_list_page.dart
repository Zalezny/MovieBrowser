import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/core/di/injection.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:flutter_recruitment_task/features/movie/domain/use_cases/search_movies_use_case.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/widgets/movie_card.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/widgets/search_box.dart';
import 'package:flutter_recruitment_task/shared/utils/number_formatters.dart';
import 'package:flutter_recruitment_task/shared/widgets/list_divider.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  MovieListPageState createState() => MovieListPageState();
}

class MovieListPageState extends State<MovieListPage> {
  final _searchMoviesUseCase = getIt<SearchMoviesUseCase>();

  Future<Either<Failure, List<Movie>>> _movieList = Future.value(right([]));

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.movie_creation_outlined),
              onPressed: () {
                //TODO implement navigation
              },
            ),
          ],
          title: Text('Movie Browser'),
        ),
        body: Column(
          children: <Widget>[
            SearchBox(onSubmitted: _onSearchBoxSubmitted),
            Expanded(child: _buildContent()),
          ],
        ),
      );

  Widget _buildContent() => FutureBuilder<Either<Failure, List<Movie>>>(
        future: _movieList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return snapshot.data?.fold(
                (failure) => _buildError(failure.message),
                (movies) => _buildMoviesList(movies),
              ) ??
              const SizedBox.shrink();
        },
      );

  Widget _buildError(String message) => Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Text(message),
      );

  Widget _buildMoviesList(List<Movie> movies) => ListView.separated(
        separatorBuilder: (_, __) => const ListDivider(),
        itemBuilder: (context, index) => MovieCard(
          title: movies[index].title,
          rating: movies[index].voteAverage.toRatingPercent(),
          onTap: () {},
        ),
        itemCount: movies.length,
      );

  void _onSearchBoxSubmitted(String text) {
    setState(() {
      if (text.isNotEmpty) {
        _movieList = _searchMoviesUseCase(text);
      } else {
        _movieList = Future.value(right([]));
      }
    });
  }
}
