import 'package:ui_store_design/models/shipping_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel{

  @JsonKey(name: 'id')
  final String userID;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'username')
  final String username;

  // final ShippingModel shippingModel;

  UserModel(this.userID, this.email, this.firstName, this.lastName, this.username);

  factory UserModel.fromJson(Map<String, dynamic> json)=> _$UserModelFromJson(json);
  Map<String, dynamic> toJson => _$UserModelToJson(this);
}