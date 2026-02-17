import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/movie_list_state.freezed.dart';

@freezed
sealed class MovieListState with _$MovieListState {
  const factory MovieListState.initial() = _Initial;
  const factory MovieListState.loading() = _Loading;
  const factory MovieListState.success(List<Movie> movies) = _Success;
  const factory MovieListState.failure(String message) = _Failure;
}
