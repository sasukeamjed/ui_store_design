import 'package:ui_store_design/models/shipping_model.dart';

class UserModel{

  final String userID;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final ShippingModel shippingModel;

  UserModel(this.userID, this.email, this.firstName, this.lastName, this.phoneNumber, this.shippingModel);
}