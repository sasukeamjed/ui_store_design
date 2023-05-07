import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/category_model.dart';
import 'package:ui_store_design/screens/search_page/search_text_field.dart';
import 'package:ui_store_design/screens/shop_screen/components/filter_dropdown_buttons/color_filter_dropdown_button.dart';
import 'package:ui_store_design/screens/shop_screen/components/filter_dropdown_buttons/sort_by_dropdown_button.dart';
import 'package:ui_store_design/screens/shop_screen/components/filter_dropdown_buttons/sort_by_price_dropdown_button.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

import '../../../providers/data_providers.dart';

class ShopSliverAppBar extends StatefulWidget {
  const ShopSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ShopSliverAppBar> createState() => _ShopSliverAppBarState();
}

class _ShopSliverAppBarState extends State<ShopSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 4,
      forceElevated: true,
      snap: false,
      pinned: true,
      floating: true,
      expandedHeight: 200.h,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        centerTitle: true,
        background: Column(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 24.w,
                      ),
                      tooltip: 'Back',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: SearchTextField(
                        isActive: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      size: 24.w,
                    ),
                    tooltip: 'Filters Icon',
                    onPressed: () {},
                  ),
                  Expanded(
                    child: _flexibleAppBarCategories(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: SortByDropDownButton(
                  hintText: "Sort By",
                  values: [
                    "Popular",
                    "Sales",
                    "New",
                    "Price:Low to High",
                    "Price:High to low"
                  ],
                ),
              ),
              Expanded(
                child: ColorFilterDropDownButton(),
              ),
              Expanded(
                child: SortByPriceRangeDropDownButton(
                  hintText: "Price",
                  values: ["0 - 20", "20 -32", "32 - 40", "40 - 52", "52 - 60"],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flexibleAppBarCategories() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        List<CategoryModel> categories =
            (ref.watch(productsDataProvider) as DataLoaded).categories;
        return ListView(
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            children: categories.mapIndexed((index, category) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 20,
                  margin: EdgeInsets.only(
                    left: 10.w,
                    right: 5.w,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                          image:
                          NetworkImage(category.image.getThumbnailImage()),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Center(
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Avenir-Book",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList());
      },
    );
  }



}






