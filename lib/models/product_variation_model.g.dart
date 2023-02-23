// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariationModel _$ProductVariationModelFromJson(
        Map<String, dynamic> json) =>
    ProductVariationModel(
      isInStock: json['is_in_stock'] as bool,
      attributes: json['attributes'] as Map<String, dynamic>,
      dimensions: json['dimensions'] as String,
      variationPrice: json['variation_price'] as String,
      image: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      variationSku: json['variation_sku'] as String,
      variationId: json['variation_id'] as int,
    );

Map<String, dynamic> _$ProductVariationModelToJson(
        ProductVariationModel instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'dimensions': instance.dimensions,
      'variation_price': instance.variationPrice,
      'image': instance.image,
      'variation_sku': instance.variationSku,
      'variation_id': instance.variationId,
      'is_in_stock': instance.isInStock,
    };
