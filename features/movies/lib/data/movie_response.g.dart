// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      json['id'] as String?,
      json['poster_path'] as String?,
      json['vote_average'] as String?,
      (json['original_title'] as num?)?.toInt(),
      (json['title'] as num?)?.toInt(),
      (json['overview'] as num?)?.toInt(),
      (json['release_date'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'title': instance.title,
    };
