import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/body.dart';

class DetailsScreen2 extends StatelessWidget {
  //ToDo: change the appbar heart icon to cart icon
  const DetailsScreen2({required this.product});

  static String routeName = "/details2";
  final Product product;

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
            width: 10.w,
          ),
          Icon(Icons.favorite),
          SizedBox(
            width: 20.w,
          ),
        ],
        title: FittedBox(
          child: Text(
            product.title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Body(
        product: product,
      ),
      bottomNavigationBar: Container(
        color: Colors.green,
        height: kToolbarHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  child: FittedBox(
                    child: Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Icon(Icons.favorite_border),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  // width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  child: TextButton(
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(fontFamily: "Avenir", fontSize: 15.sp),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
