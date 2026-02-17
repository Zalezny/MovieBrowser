import 'package:flutter_recruitment_task/features/movie/data/models/movie_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/movie_list_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieListDto {
  final int totalResults;
  final List<MovieDto> results;

  const MovieListDto({
    required this.totalResults,
    required this.results,
  });

  factory MovieListDto.fromJson(Map<String, dynamic> json) =>
      _$MovieListDtoFromJson(json);
}
