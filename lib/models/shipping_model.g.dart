// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingModel _$ShippingModelFromJson(Map<String, dynamic> json) =>
    ShippingModel(
      state: json['state'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String,
      address1: json['address_1'] as String,
      address2: json['address_2'] as String?,
      city: json['city'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ShippingModelToJson(ShippingModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'state': instance.state,
      'city': instance.city,
      'phone': instance.phone,
    };
