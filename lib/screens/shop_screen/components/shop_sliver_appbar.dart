import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/category_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/screens/search_page/search_page.dart';
import 'package:ui_store_design/screens/search_page/search_text_field.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

import '../../../providers/data_providers.dart';

class ShopSliverAppBar extends StatelessWidget {
  const ShopSliverAppBar({
    Key? key,
  }) : super(key: key);

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
        // title: Container(
        //   color: Colors.red,
        //   child: TextField(
        //     decoration: InputDecoration(
        //       hintText: "Search",
        //     ),
        //   ),
        // ),
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
                child: FilterDropDownButton(
                  hintText: "Sort By",
                  values: ["Popular", "Sales", "New", "Price:Low to High", "Price:High to low"],
                ),
              ),
              Expanded(
                child: FilterDropDownButton(
                  hintText: "Color",
                  values: ["Green", "Black", "White", "Blue", "Yellow"],
                ),
              ),
              Expanded(
                child: FilterDropDownButton(
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

class FilterDropDownButton extends StatefulWidget {
  const FilterDropDownButton({Key? key, required this.hintText, required this.values})
      : super(key: key);

  final String hintText;
  final List<dynamic> values;

  @override
  State<FilterDropDownButton> createState() => _FilterDropDownButtonState();
}

class _FilterDropDownButtonState extends State<FilterDropDownButton> {


  late dynamic dropdownValue = null;

  @override
  void initState() {
    // dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      hint: Center(child: Text(widget.hintText)),
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      isExpanded: true,
      underline: SizedBox(),
      onChanged: (dynamic value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.values.map<DropdownMenuItem<dynamic>>((dynamic value) {
        return DropdownMenuItem<dynamic>(
          value: value,
          child: Center(
            child: Text(value.toString(), textAlign: TextAlign.center,),
          ),
        );
      }).toList(),
    );
  }
}
