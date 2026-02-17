import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/pages/movie_details_page.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/pages/movie_list_page.dart';
import 'package:flutter_recruitment_task/features/two_buttons/presentation/pages/two_buttons_page.dart';

class AppRouter {
  static const movieList = '/';
  static const movieDetails = '/details';
  static const twoButtons = '/two_buttons';

  static Map<String, WidgetBuilder> get routes => {
        movieList: (_) => const MovieListPage(),
        movieDetails: (_) => const MovieDetailsPage(),
        twoButtons: (_) => const TwoButtonsPage(),
      };
}
