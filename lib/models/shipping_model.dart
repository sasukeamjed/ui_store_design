import 'package:json_annotation/json_annotation.dart';

part 'shipping_model.g.dart';

@JsonSerializable()
class ShippingModel{
  final String? firstName;
  final String lastName;
  final String address1;
  final String? address2;
  final String state;
  final String city;
  final String phone;

  ShippingModel({required this.state,
      required this.firstName,
      required this.lastName,
      required this.address1,
      required this.address2,
      required this.city,
      required this.phone});

  factory ShippingModel.fromJson(Map<String, dynamic> json)=> _$ShippingModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingModelToJson(this);

  @override
  String toString() {
    return 'firstname : $firstName, lastname : $lastName, address1 : $address1, address2 : $address2, state : $state, city : $city, phone : $phone' ;
  }
}