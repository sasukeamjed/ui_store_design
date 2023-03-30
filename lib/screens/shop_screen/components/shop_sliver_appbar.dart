import 'package:collection/collection.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/colors_library/string_color_genrator.dart';
import 'package:ui_store_design/models/category_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/screens/search_page/search_page.dart';
import 'package:ui_store_design/screens/search_page/search_text_field.dart';
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
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final Set<String> colors =
                        ref.read(productsDataProvider.notifier).getColors();
                    return TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Colors",
                                // style: Theme.of(context)
                                //     .textTheme
                                //     .titleMedium
                                //     ?.copyWith(
                                //         color: Theme.of(context).hintColor),
                                style: TextStyle(
                                    fontFamily: "Avenir-Book",
                                    color: Theme.of(context).hintColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // Spacer(),
                          Icon(
                            Icons.arrow_downward,
                            color: Theme.of(context).hintColor,
                          ),
                        ],
                      ),
                      onPressed: () {
                        // openFilterDelegate(context, colors);
                        openFilterDialog(colors);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.transparent),
                        surfaceTintColor: Colors.green,
                        shadowColor: Colors.green,
                        foregroundColor: Colors.grey
                        // foregroundColor: Colors.black,
                      ),
                    );
                  },
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

  void openFilterDialog(Set<String> colorsNames) async {
    List<String>? selectedColors = [];
    await FilterListDialog.display<String>(
      context,
      listData: colorsNames.toList(),
      selectedListData: selectedColors,
      choiceChipLabel: (color) => color,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (color, query) {
        return color.toLowerCase().contains(query.toLowerCase());
      },
      choiceChipBuilder: (context, colorName, isClicked) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 30,
              width: 50,
              child: Center(
                child: Text(
                  colorName.toString(),
                ),
              ),
              decoration: BoxDecoration(
                color: getColorHexFromName(colorName),
                borderRadius: BorderRadius.circular(20),
                border: isClicked != null
                    ? isClicked
                        ? Border.all(color: Colors.orange.shade300, width: 2)
                        : null
                    : null,
              ),
            ),
            if (isClicked != null)
              if (isClicked)
                Icon(
                  Icons.close,
                  color: Colors.orange.shade300,
                  size: 10,
                ),
          ],
        );
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedColors = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  Future<void> openFilterDelegate(
      BuildContext context, List<String> colorsNames) async {
    List<String>? selectedColors = [];

    await FilterListDelegate.show<String>(
      context: context,
      list: colorsNames,
      selectedListData: selectedColors,
      theme: FilterListDelegateThemeData(
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          tileColor: Colors.white,
          selectedColor: Colors.red,
          selectedTileColor: const Color(0xFF649BEC).withOpacity(.5),
          textColor: Colors.blue,
        ),
      ),
      // enableOnlySingleSelection: true,
      onItemSearch: (color, query) {
        return color.toLowerCase().contains(query.toLowerCase());
      },
      tileLabel: (color) => color,
      emptySearchChild: const Center(child: Text('No user found')),
      // enableOnlySingleSelection: true,
      searchFieldHint: 'Search Here..',
      /*suggestionBuilder: (context, user, isSelected) {
        return ListTile(
          title: Text(user.name!),
          leading: const CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          selected: isSelected,
        );
      },*/
      onApplyButtonClick: (list) {
        setState(() {
          selectedColors = list;
        });
      },
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
  const FilterDropDownButton(
      {Key? key, required this.hintText, required this.values})
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
      hint: Center(
        child: Text(
          widget.hintText,
          style: TextStyle(
              fontFamily: "Avenir-Book",
              color: Theme.of(context).hintColor,
              fontWeight: FontWeight.bold),
        ),
      ),
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
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class ColorFilterDropDownButton extends StatefulWidget {
  const ColorFilterDropDownButton(
      {Key? key, required this.hintText, required this.values})
      : super(key: key);

  final String hintText;
  final List<dynamic> values;

  @override
  _ColorFilterDropDownButtonState createState() =>
      _ColorFilterDropDownButtonState();
}

class _ColorFilterDropDownButtonState extends State<ColorFilterDropDownButton> {
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
            child: Container(
              height: 15,
              width: 15,
              color: getColorHexFromName("yellow"),
            ),
          ),
        );
      }).toList(),
    );
  }
}
