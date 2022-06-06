// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      dateCreated: json['dateCreated'] as String,
      dateCreatedGmt: json['dateCreatedGmt'] as String,
      dateModified: json['dateModified'] as String,
      dateModifiedGmt: json['dateModifiedGmt'] as String,
      role: json['role'] as String,
      billingModel:
          BillingModel.fromJson(json['billingModel'] as Map<String, dynamic>),
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      shipping: json['shipping'] == null
          ? null
          : ShippingModel.fromJson(json['shipping'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'shipping': instance.shipping,
      'dateCreated': instance.dateCreated,
      'dateCreatedGmt': instance.dateCreatedGmt,
      'dateModified': instance.dateModified,
      'dateModifiedGmt': instance.dateModifiedGmt,
      'role': instance.role,
      'billingModel': instance.billingModel,
    };
