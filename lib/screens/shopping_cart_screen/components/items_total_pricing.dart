import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    );
  }
}
