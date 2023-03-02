import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel{

  final int id;

  final String src;

  final String name;

  const ImageModel({this.id = 6, this.src = "https://4ustore.net/wp-content/uploads/woocommerce-placeholder.png", this.name = "woocommerce-placeholder.png"});

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