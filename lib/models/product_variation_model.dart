//plan to pick product variation
//first try to make and attribute object for each variation
import 'package:json_annotation/json_annotation.dart';
import 'package:ui_store_design/models/image_model.dart';

part 'product_variation_model.g.dart';

@JsonSerializable()
class ProductVariationModel{
  final int id;
  final Map<String, dynamic> attributes;
  final String dimensions;
  @JsonKey(name: 'variation_price')
  final String variationPrice;
  // final String displayRegularPrice;
  final ImageModel image;
  @JsonKey(name: 'variation_sku')
  final String variationSku;
  @JsonKey(name: 'variation_id')
  final int variationId;
  @JsonKey(name: 'is_in_stock')
  final bool isInStock;
  //ToDo: filter the products which has 0 priced
  ProductVariationModel({
    required this.isInStock,
    required this.id,
    required this.attributes,
    required this.dimensions,
    required this.variationPrice,
    required this.image,
    // required this.displayRegularPrice,

    required this.variationSku,
    required this.variationId,
  });

  factory ProductVariationModel.fromJson(Map<String, dynamic> json)=> _$ProductVariationModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVariationModelToJson(this);

  @override
  String toString() {
    return "variationPrice => $variationPrice , dimension => $dimensions, attributes => $attributes";
  }


}
