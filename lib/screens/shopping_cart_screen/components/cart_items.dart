import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/cart_state_notifier.dart';

class CartItems extends ConsumerWidget {
  const CartItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.orange,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  "4 items",
                  style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                // color: Colors.blue,
                child: ListView.builder(
                  itemCount: ref.watch(cartItemNotifier).length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 15.0.h),
                      child: Dismissible(
                        //ToDo: add id key for dismissible widget
                        key: Key(ref.read(cartItemNotifier)[index].cartItemId.toString()),
                        direction: DismissDirection.endToStart,
                        background: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 15.w),
                            height: 62.w,
                            width: 62.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFF2D55),
                            ),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                        child: CartItemWidget(
                          cartItem: ref.read(cartItemNotifier)[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {Key? key,
        // required this.itemsCount,
        required this.cartItem})
      : super(key: key);


  // final int itemsCount;
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      //ToDo: import product data
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: buildCartItemImage(
            image: cartItem.productIsChosen.product.thumbnailImages[0],
            itemsCount: 0,
          ),
        ),
        // SizedBox(
        //   width: 15.w,
        // ),
        Expanded(
          child: Container(
            height: 103.h,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  cartItem.productIsChosen.product.title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: "Avenir",
                  ),
                ),
                Text(
                  "\$${cartItem.productIsChosen.product.price}",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 15.sp,
                    fontFamily: "Avenir-Book",
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 10.w,
                      width: 10.w,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Black",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 15.sp,
                        fontFamily: "Avenir-Book",
                      ),
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Text(
                      "|",
                      style: TextStyle(color: Color(0xFFBEC2CE)),
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Text(
                      "Size : ",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 15.sp,
                        fontFamily: "Avenir-Book",
                      ),
                    ),
                    Text(
                      "15",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontFamily: "Avenir-Book",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Stack buildCartItemImage({required String image, required int itemsCount}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            height: 88.w,
            width: 88.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Container(
            height: 18.w,
            width: 18.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Center(
                child: Text(
                  itemsCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Avenir-Medium",
                    fontSize: 11.sp,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}


