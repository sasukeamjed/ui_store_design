import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel{
  final int id;
  final String src;
  final String name;

  ImageModel({required this.id, required this.src, required this.name});

  factory ImageModel.fromJson(Map<String, dynamic> json)=> _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}