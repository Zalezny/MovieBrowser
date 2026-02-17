import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/core/router/app_router.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Movie Browser',
        theme: ThemeData(primarySwatch: Colors.amber),
        initialRoute: AppRouter.movieList,
        routes: AppRouter.routes,
      );
}
