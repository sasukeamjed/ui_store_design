import 'package:flutter/material.dart';
import 'package:ui_store_design/size_config.dart';

class HomeUpperHeader extends StatelessWidget {
  const HomeUpperHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(243),
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/images/home/home_header.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HomeAppBar(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: Text(
              "Black Fridays",
              style: TextStyle(
                fontFamily: "Avenir-Book",
                fontSize: getProportionateScreenWidth(17),
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: Text(
              "Sale Up\nTo 70% Off",
              style: TextStyle(
                fontFamily: "Poppins-SemiBold",
                fontSize: getProportionateScreenWidth(40),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: SizedBox(
              width: getProportionateScreenWidth(112),
              height: getProportionateScreenWidth(34),
              child: TextButton(
                child: Text(
                  "Shop Now",
                  style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: getProportionateScreenWidth(15)),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
