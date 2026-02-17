import 'package:flutter/material.dart';

class MovieErrorView extends StatelessWidget {
  final String message;

  const MovieErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Text(message),
      );
}
