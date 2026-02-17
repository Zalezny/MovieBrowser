import 'package:flutter_recruitment_task/features/movie/domain/entities/movie_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/movie_details_dto.freezed.dart';
part 'generated/movie_details_dto.g.dart';

@freezed
abstract class MovieDetailsDto with _$MovieDetailsDto {
  const MovieDetailsDto._();

  const factory MovieDetailsDto({
    required int id,
    required String title,
    required int budget,
    required int revenue,
  }) = _MovieDetailsDto;

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDtoFromJson(json);

  MovieDetails toEntity() => MovieDetails(
        id: id,
        title: title,
        budget: budget,
        revenue: revenue,
      );
}
