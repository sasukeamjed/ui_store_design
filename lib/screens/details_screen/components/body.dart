import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';
import 'package:ui_store_design/screens/details_screen/components/product_main_title_with_price.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductMainTitleWithPrice(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              ...List.generate(
                  5,
                  (index) => IsFavoriteStar(
                        isFavorite: true,
                      )),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "(323 reviews)",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: "Avenir-Book",
                    color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        ProductImagesSlider(),
        SizedBox(
          height: 18.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2.5,
                      ),
                    ),
                  ),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: "Avenir",
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Text(
                      "Review",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Roman",
                        color: Colors.black.withOpacity(0.5),
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                  ),
                  child: Text(
                    "Additional information",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: "Avenir-Roman",
                      color: Colors.black.withOpacity(0.5),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          // color: Colors.black,
          color: Colors.black.withOpacity(0.2),
        ),
        SizedBox(
          height: 24.5.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Text(
                "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est",
                style: TextStyle(
                  height: 1.3,
                  fontFamily: "Avenir-Book",
                  fontSize: 17.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
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
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



