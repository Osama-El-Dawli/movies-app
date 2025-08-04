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
  final String? title;
  @JsonKey(name: 'overview')
  final String? subTitle;
  @JsonKey(name: 'poster_path')
  final String? image;
  @JsonKey(includeFromJson: false)
  final bool isBookmarked;

  const MovieModel({
    this.isBookmarked = false,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
