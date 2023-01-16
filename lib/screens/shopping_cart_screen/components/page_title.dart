import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/providers/cart_state_notifier.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Container(
          // color: Colors.green,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  "Shopping Cart",
                  style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
                ),
                Spacer(),
                Consumer(builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: (){
                      ref.watch(cartItemNotifier.notifier).emptyCart();
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.green,
                      size: 36.h,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
