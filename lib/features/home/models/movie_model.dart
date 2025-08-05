import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class ModelResponse {
  final List<MovieModel>? results;

  ModelResponse({required this.results});

  factory ModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ModelResponseFromJson(json);
}

@JsonSerializable()
class MovieModel {
  final int id;
  final String? title;
  @JsonKey(name: 'overview')
  final String? subTitle;
  @JsonKey(name: 'poster_path')
  final String? image;

   MovieModel({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.id,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toMap() => _$MovieModelToMap(this);
}
