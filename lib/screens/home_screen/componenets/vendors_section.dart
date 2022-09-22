import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/home_screen/componenets/vendor_item.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

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
          Text(
            "Partner Vendors",
            style: TextStyle(
              fontFamily: "Avenir",
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          if (state is DataLoaded)
            ListView.builder(
              itemCount: state.vendors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
                return VendorItem(vendor: state.vendors[index],);
              },
            ),
        ],
      ),
    );
  }
}

