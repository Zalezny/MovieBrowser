import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_detail_item.dart';
import 'package:flutter_recruitment_task/shared/widgets/list_divider.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  MovieDetailsPageState createState() => MovieDetailsPageState();
}

class MovieDetailsPageState extends State<MovieDetailsPage> {
  final _details = [
    MovieDetailItem(title: 'Budget', content: '\$2400000'),
    MovieDetailItem(title: 'Revenue', content: '\$10000000'),
    MovieDetailItem(title: 'Should I watch it today?', content: 'Yes!'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          separatorBuilder: (_, __) => const ListDivider(),
          itemBuilder: (context, index) => Container(
            key: ValueKey(_details[index].title),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _details[index].title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 8.0),
                Text(
                  _details[index].content,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          itemCount: _details.length,
        ),
      );
}
