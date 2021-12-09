import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getProportionateScreenWidth(20),
            bottom: 5.0,
            right: getProportionateScreenWidth(20),
            left: getProportionateScreenWidth(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Justo gravida semper",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontFamily: "Avenir"),
              ),
              Text(
                "\$24.00",
                style: TextStyle(
                    color: Color(0xFFFF2D55),
                    fontSize: getProportionateScreenWidth(20),
                    fontFamily: "Avenir-Book"),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            children: [
              ...List.generate(
                  5,
                  (index) => IsFavoriteStar(
                        isFavorite: true,
                      )),
              SizedBox(
                width: 8,
              ),
              Text(
                "(323 reviews)",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontFamily: "Avenir-Book",
                    color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        ProductImagesSlider(),
        SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15)),
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
                      fontSize: getProportionateScreenWidth(17),
                      fontFamily: "Avenir",
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(48)),
                  child: Text(
                    "Review",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(17),
                      fontFamily: "Avenir-Roman",
                      color: Colors.black.withOpacity(0.5),
                      height: 1.5,
                    ),
                  ),
                ),
                Text(
                  "Additional information",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(17),
                    fontFamily: "Avenir-Roman",
                    color: Colors.black.withOpacity(0.5),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          // color: Colors.black,
          color: Color(0xFFF1F2F6),
        ),
      ],
    );
  }
}
