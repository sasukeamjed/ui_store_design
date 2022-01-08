import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  //shopping_cart body
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Shopping Cart",
            style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "4 items",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
          //ToDo: change the container to sizedbox widget
          Container(
            color: Colors.red,
            height: 360.h,
            child: SizedBox(
              height: 103.h,
              child: Row( //ToDo: import product data
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCartItemImage(
                    image: "assets/images/cart_items/cart_item_1.jpg",
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              "Atelier Ottoman Takumi Series",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontFamily: "Avenir",
                              ),
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
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text("Black", style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 15.sp,
                                fontFamily: "Avenir-Book",
                              ),),
                              SizedBox(
                                width: 13.w,
                              ),
                              Text("|"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack buildCartItemImage({required String image}) {
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
              "2",
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
