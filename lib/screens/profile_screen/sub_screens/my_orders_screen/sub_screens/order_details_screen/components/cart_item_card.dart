import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      width: double.infinity,
      child: Card(
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                height: double.infinity,
                child: Image.asset(
                  "assets/images/best_sellers/best_sellers_item1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ProductName",
                      style: TextStyle(
                        fontFamily: "Avenir",
                      ),
                    ),
                    Text(
                      "category",
                      style: TextStyle(
                        fontFamily: "Avenir-Book",
                        fontSize: 12.sp,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "color: ",
                                style: TextStyle(
                                  fontFamily: "Avenir-Book",
                                  fontSize: 12.sp,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                              TextSpan(
                                  text: "grey",
                                  style: TextStyle(
                                      fontFamily: "Avenir-Book",
                                      fontSize: 12.sp,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "size: ",
                                style: TextStyle(
                                  fontFamily: "Avenir-Book",
                                  fontSize: 12.sp,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                              TextSpan(
                                  text: "L",
                                  style: TextStyle(
                                      fontFamily: "Avenir-Book",
                                      fontSize: 12.sp,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "quantity: ",
                                style: TextStyle(
                                  fontFamily: "Avenir-Book",
                                  fontSize: 12.sp,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                              TextSpan(
                                  text: "1",
                                  style: TextStyle(
                                      fontFamily: "Avenir-Book",
                                      fontSize: 12.sp,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                        Text(
                          "51\$",
                          style: TextStyle(color: Colors.black, fontSize: 14.sp),
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
    );
  }
}