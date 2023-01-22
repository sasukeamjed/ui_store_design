import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/components/delivery_status_filter.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/components/list_of_orders.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/components/page_title.dart';

class Body extends StatelessWidget {
  //My Orders Screen Body

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.w,
              ),
              DeliveryStatusFilter(),
              SizedBox(
                height: 20.w,
              ),
              Container(
                height: 520.h,
                child: ListOfOrders(),
              ),
            ],
          ),
        )
      ],
    );
  }
}





