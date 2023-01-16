import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/providers/cart_items_total_price.dart';
import 'package:ui_store_design/providers/cart_state_notifier.dart';

class ItemsTotalPricing extends StatelessWidget {
  const ItemsTotalPricing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w,),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              // color: Colors.green,
              width: double.infinity,
              child: Consumer(
                builder: (context, ref, child){

                  // double cartTotalPrice(){
                  //   double totalPrice = 0.00;
                  //   if(ref.watch(cartItemNotifier).isNotEmpty){
                  //     ref.watch(cartItemNotifier).forEach((cartItem) {
                  //       totalPrice = totalPrice + (cartItem.productIsChosen.price * cartItem.quantity);
                  //     });
                  //     return totalPrice;
                  //   }else{
                  //     totalPrice = 0.00;
                  //   }
                  //   return totalPrice;
                  // }

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping fee:",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: "Avenir-Book",
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            "\$6.99",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: "Avenir-Book",
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub total:",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: "Avenir-Book",
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            "\$79.99",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: "Avenir-Book",
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: "Avenir",
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${ref.watch(cartItemsTotalPriceProvider)} OMR",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: "Avenir",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
