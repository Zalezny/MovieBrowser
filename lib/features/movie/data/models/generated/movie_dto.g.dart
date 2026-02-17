// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDto _$MovieDtoFromJson(Map<String, dynamic> json) => _MovieDto(
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$MovieDtoToJson(_MovieDto instance) => <String, dynamic>{
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'id': instance.id,
    };
