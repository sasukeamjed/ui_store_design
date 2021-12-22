import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/body.dart';

class DetailsScreen2 extends StatelessWidget {

  //ToDo: change the appbar heart icon to cart icon
  const DetailsScreen2({Key? key}) : super(key: key);

  static String routeName = "/details2";

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
    );
  }
}
