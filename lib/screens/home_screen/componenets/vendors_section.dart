import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/screens/home_screen/componenets/vendor_item.dart';

import '../../../services/data/data.dart';

class VendorsSection extends ConsumerWidget {
  const VendorsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(dataProvider);
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Partner Vendors",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 24.sp,
                ),
              ),
              Spacer(),
              Text(
                "Show all",
                style: TextStyle(fontFamily: "Avenir-Book", fontSize: 15.sp),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 140.h,
            child: ref.watch(dataProvider)!.isEmpty ? Center(child: CircularProgressIndicator(),):ListView.builder(
              shrinkWrap: true,
              itemCount: state?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: VendorItem(
                    vendor: state![index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
