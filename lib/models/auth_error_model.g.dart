// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthErrorModel _$AuthErrorModelFromJson(Map<String, dynamic> json) =>
    AuthErrorModel(
      status: json['status'] as String,
      error: json['error'] as String,
      code: json['code'] as String,
      errorDescription: json['error_description'] as String,
    );

Map<String, dynamic> _$AuthErrorModelToJson(AuthErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'code': instance.code,
      'error_description': instance.errorDescription,
    };
