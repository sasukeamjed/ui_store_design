import 'package:json_annotation/json_annotation.dart';

part 'auth_error_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class AuthErrorModel{
  final String status;
  final String error;
  final String code;
  final String errorDescription;

  factory AuthErrorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthErrorModelFromJson(json);

  AuthErrorModel({required this.status, required this.error, required this.code, required this.errorDescription});

  Map<String, dynamic> toJson() => _$AuthErrorModelToJson(this);

  @override
  String toString() {
    return 'status : $status, error : $error, code : $code, errorDescription : $errorDescription';
  }
}