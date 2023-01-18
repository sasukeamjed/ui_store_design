import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/services/payment/create_session.dart';

class PaymentButton extends ConsumerWidget {
  const PaymentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Center(
            child: Text("PAYMENT", style: TextStyle(fontSize: 15.sp, color: Colors.white, fontFamily: "Avenir"),),
          ),
        ),
        onTap: (){
          final paymentSession = PaymentSession(cartItems: cartItems, customerId: customerId, customerName: customerName);

        },
      ),
    );
  }
}