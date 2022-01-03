import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Description",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.",
            style: TextStyle(fontSize: 17.sp, fontFamily: "Avenir-Book"),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Sku:",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "545",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Categories:",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Furniture, Accessories",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Tags:",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "#furniture, #table",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Dimensions:",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "185 x 40 x 62 cm (L x W x H)",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
