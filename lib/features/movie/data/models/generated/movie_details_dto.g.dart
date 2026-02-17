// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../movie_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailsDto _$MovieDetailsDtoFromJson(Map<String, dynamic> json) =>
    _MovieDetailsDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      budget: (json['budget'] as num).toInt(),
      revenue: (json['revenue'] as num).toInt(),
    );

Map<String, dynamic> _$MovieDetailsDtoToJson(_MovieDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'budget': instance.budget,
      'revenue': instance.revenue,
    };
