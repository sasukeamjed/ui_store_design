import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';
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
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
        Stack(
          children: [
            Image.asset(
              "assets/images/details_page/details_page_product_img.png",
              fit: BoxFit.fitWidth,
              height: getProportionateScreenWidth(250),
            ),
            Positioned(child: ImageCircle(),),
          ],
        ),
      ],
    );
  }
}

class ImageCircle extends StatelessWidget {
  const ImageCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(10),
      width: getProportionateScreenWidth(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }
}



