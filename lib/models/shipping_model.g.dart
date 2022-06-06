// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingModel _$ShippingModelFromJson(Map<String, dynamic> json) =>
    ShippingModel(
      state: json['state'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      city: json['city'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ShippingModelToJson(ShippingModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address1': instance.address1,
      'address2': instance.address2,
      'state': instance.state,
      'city': instance.city,
      'phone': instance.phone,
    };
