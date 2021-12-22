import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/screens/details_screen/components/body.dart';
import 'package:ui_store_design/size_config.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.2,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back)),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 20.w,
          ),
          Icon(Icons.favorite),
          SizedBox(
            width: 20.w,
          ),
        ],
        title: Text(
          "Lambs",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: BuildButton(
              press: () {},
              text: "ADD TO CART",
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: SvgPicture.asset("assets/icons/left_curved_arrow.svg"),
          ),
        ],
      ),
    );
  }
}
