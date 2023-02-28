import 'package:json_annotation/json_annotation.dart';

import 'image_model.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel{
  final int id;
  final String name;
  final String slug;
  final int parent;
  final String description;
  @JsonKey(defaultValue: ImageModel(id: 6, src: '', name: '', ))
  final ImageModel image;
  final int count;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.slug,
      required this.parent,
      required this.description,
      required this.image,
      required this.count});

  factory CategoryModel.fromJson(Map<String, dynamic> json)=> _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}