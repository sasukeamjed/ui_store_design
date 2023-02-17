// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      type: json['type'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      status: json['status'] as String,
      featured: json['featured'] as bool,
      description: json['description'] as String,
      shortDescription: json['short_description'] as String,
      sku: json['sku'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,
      totalSales: json['total_sales'] as int,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      dimensions:
          DimensionsModel.fromJson(json['dimensions'] as Map<String, dynamic>),
      attributes: (json['attributes'] as List<dynamic>)
          .map((e) => AttributesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productVariations: (json['product_variations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date_created': instance.dateCreated?.toIso8601String(),
      'type': instance.type,
      'status': instance.status,
      'featured': instance.featured,
      'description': instance.description,
      'short_description': instance.shortDescription,
      'sku': instance.sku,
      'price': instance.price,
      'total_sales': instance.totalSales,
      'dimensions': instance.dimensions,
      'images': instance.images,
      'categories': instance.categories,
      'attributes': instance.attributes,
      'product_variations': instance.productVariations,
    };
