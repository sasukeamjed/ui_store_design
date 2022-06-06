import 'package:json_annotation/json_annotation.dart';

part 'billing_model.g.dart';

@JsonSerializable()
class BillingModel {
  final String firstName;
  final String lastName;
  final String? company;
  final String address1;
  final String? address2;
  final String city;
  final String postcode;
  final String country;
  final String state;
  final String email;
  final String phone;

  BillingModel(
      {required this.firstName,
      required this.lastName,
      required this.company,
      required this.address1,
      required this.address2,
      required this.city,
      required this.postcode,
      required this.country,
      required this.state,
      required this.email,
      required this.phone});

  factory BillingModel.fromJson(Map<String, dynamic> json) =>
      _$BillingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillingModelToJson(this);

  @override
  String toString() {
    return 'city : $city, email : $email, firstname : $firstName, company : $company, address1 : $address1, postcode : $postcode, country : $country, state : $state, email : $email, phone : $phone';
  }
}
