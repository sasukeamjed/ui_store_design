import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/payment_successful_screen/components/body.dart';


class PaymentSuccessfulScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Confirmation"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}