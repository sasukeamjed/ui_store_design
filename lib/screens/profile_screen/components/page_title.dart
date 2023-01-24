import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/services/auth/auth.dart';
import 'package:ui_store_design/services/auth/states/auth_state.dart';

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
              Consumer(builder: (context, ref, child){

                final state = ref.watch(authProvider) as AuthLoaded;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      state.userModel.firstName ?? "user",
                      style: TextStyle(fontFamily: "Avenir", fontSize: 17.sp),
                      // style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 1,
                    ),
                    Text(
                      state.userModel.email ?? "user email",
                      style: TextStyle(
                        fontFamily: "Avenir-Book",
                        fontSize: 15.sp,
                        color: Colors.black.withOpacity(0.4),),
                    ),
                  ],
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}