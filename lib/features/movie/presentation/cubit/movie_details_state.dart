import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/movie_details_state.freezed.dart';

@freezed
sealed class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _Initial;
  const factory MovieDetailsState.loading() = _Loading;
  const factory MovieDetailsState.success(MovieDetails movieDetails) = _Success;
  const factory MovieDetailsState.failure(String message) = _Failure;
}
