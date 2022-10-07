import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartBar extends StatelessWidget {
  const AddToCartBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
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
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                  ),
                  child: Text(
                    "Add To Cart +",
                    style: TextStyle(fontFamily: "Avenir", fontSize: 15.sp),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
