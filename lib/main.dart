import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/core/di/injection.dart';
import 'package:flutter_recruitment_task/movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MovieApp());
}
