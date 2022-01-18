import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  //shopping_cart body
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Container(
              // color: Colors.green,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Shopping Cart",
                  style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
                ),
              ),
            ),
          ),
        ),
        Divider(),
        //ToDo: change the container to sizedbox widget
        Expanded(
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
                      itemCount: shoppingCartProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 15.0.h),
                          child: CartItem(
                            image: "assets/images/cart_items/cart_item_1.jpg",
                            itemsCount: 2,
                            product: shoppingCartProducts[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
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
                  child: Column(
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
                            "\$86.98",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: "Avenir",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
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
      ],
    );
  }
}

// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);
//
//   //shopping_cart body
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 20.h,
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 15.w),
//           child: Text(
//             "Shopping Cart",
//             style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
//           ),
//         ),
//         SizedBox(
//           height: 30.h,
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 15.w),
//           child: Text(
//             "4 items",
//             style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
//           ),
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         //ToDo: change the container to sizedbox widget
//         Padding(
//           padding: EdgeInsets.only(left: 15.w),
//           child: SizedBox(
//             // color: Colors.red,
//             height: 360.h,
//             child: ListView.builder(
//               itemCount: shoppingCartProducts.length,
//               itemBuilder: (context, index){
//                 return CartItem(image: "assets/images/cart_items/cart_item_1.jpg", itemsCount: 2, product: shoppingCartProducts[index],);
//               },
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 65.h,
//         ),
//         Container(
//           color: Colors.green,
//           height: 108.h,
//           width: double.infinity,
//           padding: EdgeInsets.only(
//             top: 19.h,
//             right: 15.w,
//             left: 15.w,
//             bottom: 8.h,
//           ),
//         ),
//       ],
//     );
//   }
//
//
// }

class CartItem extends StatelessWidget {
  const CartItem(
      {Key? key,
      required this.image,
      required this.itemsCount,
      required this.product})
      : super(key: key);

  final String image;
  final int itemsCount;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      //ToDo: import product data
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCartItemImage(
          image: image,
          itemsCount: itemsCount,
        ),
        SizedBox(
          width: 15.w,
        ),
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
                  "Atelier Ottoman Takumi Series",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: "Avenir",
                  ),
                ),
                Text(
                  "\$24.00",
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
              "$itemsCount",
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
