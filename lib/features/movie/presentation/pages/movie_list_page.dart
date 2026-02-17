import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_list_cubit.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_list_state.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/widgets/movie_error_view.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/widgets/movie_list_view.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/widgets/search_box.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

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
          children: [
            SearchBox(
              onSubmitted: (text) => context.read<MovieListCubit>().searchMovies(text),
            ),
            Expanded(
              child: BlocBuilder<MovieListCubit, MovieListState>(
                builder: (context, state) => state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  success: (movies) => MovieListView(movies: movies),
                  failure: (message) => MovieErrorView(message: message),
                ),
              ),
            ),
          ],
        ),
      );
}
