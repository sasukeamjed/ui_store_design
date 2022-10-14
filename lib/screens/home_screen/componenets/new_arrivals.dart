import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/home_screen/componenets/product_item.dart';
import 'package:ui_store_design/services/data/data.dart';

class NewArrivalsSection extends ConsumerWidget {
  const NewArrivalsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(dataProvider.notifier);
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
                "New Arrivals",
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
            height: 260.h,
            child: state.sortProductsByDate().isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: ProductItem(product: state.sortProductsByDate()[index]),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen2(product: state.sortProductsByDate()[index],))),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

