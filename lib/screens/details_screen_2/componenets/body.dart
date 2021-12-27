import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/custom_expansion_tile.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';

//Details2_Body

class Body extends StatelessWidget {
  List<String> images = [
    "assets/images/details2_products/item_1.jpg",
    "assets/images/details2_products/item_2.jpg",
    "assets/images/details2_products/item_3.jpg",
    "assets/images/details2_products/item_4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImagesSlider(),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    "Olivia Shayn Military TV Cabinet",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontFamily: "Avenir",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.favorite,
                    size: 32.w,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "\$1,499.00",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: "Avenir-Book",
                      color: Color(0xFFFF2D55),
                    ),
                  ),
                ),
                ...List.generate(
                  5,
                  (index) => IsFavoriteStar(
                    isFavorite: true,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 30.h,
            color: Colors.black12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Colors",
                  style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                        6,
                        (index) => ColorCircle(
                              color: colors[index],
                            )),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Text(
                  "You may also like",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 20.sp,
                  ),
                ),
                Spacer(),
                Text(
                  "Show all",
                  style: TextStyle(fontFamily: "Avenir-Book", fontSize: 15.sp),
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(images.length,
                  (index) => buildPossiblyLikedProducts(images[index])),
            ),
          ),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
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
          ListTile(
            contentPadding: EdgeInsets.all(0),
            minVerticalPadding: 0,
            horizontalTitleGap: 0,
            leading: Icon(Icons.arrow_right),
            title: Text("COMPOSITION AND CARE"),
          ),
          CustomExpansionTile(
            leading: Icon(Icons.arrow_right),
            title: Text("COMPOSITION AND CARE"),
          ),
        ],
      ),
    );
  }

  buildPossiblyLikedProducts(String image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          image,
          height: 88.w,
          width: 88.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

List<Color> colors = [
  Color(0xFFDDB692),
  Color(0xFF007AFF),
  Color(0xFFFF9500),
  Color(0xFFFF2D55),
  Color(0xFF5856D6),
  Color(0xFFE5E5EA)
];

class ColorCircle extends StatelessWidget {
  const ColorCircle({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.w,
      width: 44.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
