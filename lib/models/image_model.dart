import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel{
  @JsonKey(defaultValue: 6)
  final int id;
  @JsonKey(defaultValue: "https://4ustore.net/wp-content/uploads/woocommerce-placeholder.png")
  final String src;
  @JsonKey(defaultValue: "woocommerce-placeholder.png")
  final String name;

  ImageModel({required this.id, required this.src, required this.name});

  factory ImageModel.fromJson(Map<String, dynamic> json)=> _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  String getThumbnailImage(){
    if(this.src.contains(".jpg")){
      List<String> parts = this.src.split(".jpg");
      String thumbnailImageUrl = parts[0] + "-150x150.jpg";

      return thumbnailImageUrl;
    }
    return this.src;
  }

  String getMediumImage(){

    if(this.src.contains(".jpg")){
      List<String> parts = this.src.split(".jpg");
      String mediumImageUrl = parts[0] + "-300x300.jpg";

      return mediumImageUrl;
    }
    return this.src;
  }
}