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
        Container(
          height: getProportionateScreenWidth(250),
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/dummy_product_images/artificial_flower_1.png",
                fit: BoxFit.fill,
                height: getProportionateScreenWidth(250),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(4, (index) => ImageCircle())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageCircle extends StatelessWidget {
  const ImageCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
      child: Container(
        height: getProportionateScreenWidth(10),
        width: getProportionateScreenWidth(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
    );
  }
}
