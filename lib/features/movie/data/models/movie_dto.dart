import 'package:flutter_recruitment_task/features/movie/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/movie_dto.freezed.dart';
part 'generated/movie_dto.g.dart';

@freezed
abstract class MovieDto with _$MovieDto {
  const MovieDto._();

  const factory MovieDto({
    required String title,
    @JsonKey(name: 'vote_average') required double voteAverage,
    required int id,
  }) = _MovieDto;

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  Movie toEntity() => Movie(title: title, voteAverage: voteAverage, id: id);
}
