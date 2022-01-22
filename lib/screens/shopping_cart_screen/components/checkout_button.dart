import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key? key, required this.tap,
  }) : super(key: key);

  final GestureTapCallback tap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: tap,
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Center(
            child: Text(
              "CHECKOUT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontFamily: "Avenir",
              ),
            ),
          ),
        ),
      ),
    );
  }
}


