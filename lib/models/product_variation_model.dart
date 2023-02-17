//plan to pick product variation
//first try to make and attribute object for each variation
import 'package:json_annotation/json_annotation.dart';

part 'product_variation_model.g.dart';

@JsonSerializable()
class ProductVariationModel{
  final Map<String, dynamic> attributes;
  final String dimensions;
  @JsonKey(name: 'variation_price')
  final String variationPrice;
  // final String displayRegularPrice;
  final Map<String, String> image;
  @JsonKey(name: 'variation_sku')
  final String variationSku;
  @JsonKey(name: 'variation_id')
  final int variationId;
  @JsonKey(name: 'is_in_stock')
  final bool isInStock;
  //ToDo: filter the products which has 0 priced
  ProductVariationModel({
    required this.isInStock,

    required this.attributes,
    required this.dimensions,
    required this.variationPrice,
    required this.image,
    // required this.displayRegularPrice,

    required this.variationSku,
    required this.variationId,
  });
  
  // factory ProductVariationModel.fromJson(Map<String, dynamic> data){
  //   return ProductVariationModel(
  //       attributes: data["attributes"],
  //       dimension: data["dimensions"],
  //       // displayPrice: data["display_price"].toString(),
  //       // displayRegularPrice: data["display_regular_price"].toString(),
  //       mediumImage: data["image"]["src"],
  //       thumbnailImage: data["image"]["thumb_src"],
  //       srcImage: data["image"]["large_image"],
  //       variationSku: data['sku'],
  //       variationId: data['variation_id'],
  //       isInStock: data['is_in_stock'],
  //       variationPrice: data['display_price'],
  //   );
  // }

  factory ProductVariationModel.fromJson(Map<String, dynamic> json)=> _$ProductVariationModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVariationModelToJson(this);

  @override
  String toString() {
    return "variationPrice => $variationPrice , dimension => $dimensions, attributes => $attributes";
  }


}
