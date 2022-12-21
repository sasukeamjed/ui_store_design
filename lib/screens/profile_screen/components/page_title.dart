import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "My Profile",
                style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.green,
                radius: 25.w,
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "My Profile Name",
                    style: TextStyle(fontFamily: "Avenir", fontSize: 17.sp),
                    // style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 1,
                  ),
                  Text(
                    "email@email.com",
                    style: TextStyle(
                        fontFamily: "Avenir-Book",
                        fontSize: 15.sp,
                        color: Colors.black.withOpacity(0.4),),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}