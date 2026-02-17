import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/core/di/injection.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_list_cubit.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/pages/movie_details_page.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/pages/movie_list_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const movieList = '/';
  static const movieDetails = '/details';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: movieList,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<MovieListCubit>(),
          child: const MovieListPage(),
        ),
      ),
      GoRoute(
        path: movieDetails,
        builder: (context, state) => const MovieDetailsPage(),
      ),
    ],
  );
}
