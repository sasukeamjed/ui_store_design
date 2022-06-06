import 'package:ui_store_design/models/shipping_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel{


  final String id;

  final String email;

  final String firstName;

  final String lastName;

  final String username;

  final ShippingModel shipping;

  UserModel({required this.id, required this.email, required this.firstName, required this.lastName, required this.username, required this.shipping, });

  factory UserModel.fromJson(Map<String, dynamic> json)=> _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}