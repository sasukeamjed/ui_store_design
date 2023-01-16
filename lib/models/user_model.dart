import 'package:ui_store_design/models/billing_model.dart';
import 'package:ui_store_design/models/shipping_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  final int? id;

  final String? email;

  final String? firstName;

  final String? lastName;

  final String? username;

  final String? phone;

  final ShippingModel? shipping;

  // final String dateCreated;

  // final String dateCreatedGmt;
  //
  // final String dateModified;
  //
  // final String dateModifiedGmt;
  //
  // final String role;
  //
  // final BillingModel billingModel;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.shipping,
    required this.phone,
  });

  // UserModel({
  //   required this.dateCreated,
  //   required this.dateCreatedGmt,
  //   required this.dateModified,
  //   required this.dateModifiedGmt,
  //   required this.role,
  //   required this.billingModel,
  //   required this.id,
  //   required this.email,
  //   required this.firstName,
  //   required this.lastName,
  //   required this.username,
  //   required this.shipping,
  // });

  UserModel copyWith(
      {String? email,
      String? firstname,
      String? lastName,
      String? username,
      ShippingModel? shippingModel,
      String? phone}) {
    return UserModel(
        id: this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        shipping: shipping ?? this.shipping,
        phone: phone ?? this.phone,);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'id : $id, email : $email, firstname : $firstName, lastname : $lastName, username : $username, shipping model => $shipping';
  }
}
