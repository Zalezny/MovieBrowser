import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_detail_item.dart';
import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_details.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_details_cubit.dart';
import 'package:flutter_recruitment_task/features/movie/presentation/cubit/movie_details_state.dart';
import 'package:flutter_recruitment_task/shared/utils/number_formatters.dart';
import 'package:flutter_recruitment_task/shared/widgets/list_divider.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: state.maybeWhen(
              success: (movieDetails) => Text(movieDetails.title),
              orElse: () => null,
            ),
          ),
          body: state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (movieDetails) => _DetailsListView(movieDetails: movieDetails),
            failure: (message) => Center(child: Text(message)),
          ),
        ),
      );
}

class _DetailsListView extends StatelessWidget {
  final MovieDetails movieDetails;

  const _DetailsListView({required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    final details = [
      MovieDetailItem(title: 'Budget', content: movieDetails.budget.toDollarFormat()),
      MovieDetailItem(title: 'Revenue', content: movieDetails.revenue.toDollarFormat()),
      MovieDetailItem(
        title: 'Should I watch it today?',
        content: movieDetails.shouldWatchToday ? 'Yes!' : 'No',
      ),
    ];

    return ListView.separated(
      separatorBuilder: (_, __) => const ListDivider(),
      itemBuilder: (context, index) => Container(
        key: ValueKey(details[index].title),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              details[index].title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            Text(
              details[index].content,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      itemCount: details.length,
    );
  }
}
