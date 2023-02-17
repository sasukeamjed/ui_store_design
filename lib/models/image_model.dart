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

  String getThumbnailImage(){

    List<String> parts = this.src.split(".jpg");
    String thumbnailImageUrl = parts[0] + "-150x150.jpg";

    return thumbnailImageUrl;
  }

  String getMediumImage(){

    List<String> parts = this.src.split(".jpg");
    String mediumImageUrl = parts[0] + "-300x300.jpg";

    return mediumImageUrl;
  }
}