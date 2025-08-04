// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelResponse _$ModelResponseFromJson(Map<String, dynamic> json) =>
    ModelResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
  title: json['title'] as String,
  subTitle: json['overview'] as String,
  image: json['poster_path'] as String,
);

