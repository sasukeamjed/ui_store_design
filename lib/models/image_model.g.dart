// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'] as int? ?? 6,
      src: json['src'] as String? ??
          'https://4ustore.net/wp-content/uploads/woocommerce-placeholder.png',
      name: json['name'] as String? ?? 'woocommerce-placeholder.png',
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'src': instance.src,
      'name': instance.name,
    };
