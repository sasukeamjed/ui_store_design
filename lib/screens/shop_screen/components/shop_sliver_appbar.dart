import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/category_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/screens/search_page/search_page.dart';
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
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 24.w,
        ),
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.filter_list,
            size: 24.w,
          ),
          tooltip: 'Filters Icon',
          onPressed: () {},
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
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
              child: TextField(),
            ),
            SizedBox(
              height: 10.h,
            ),
            Flexible(
              flex: 1,
              child: _flexibleAppBarCategories(),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          height: 40,
          color: Colors.green,
        ),
      ),
      // flexibleSpace: LayoutBuilder(
      //   builder: (BuildContext context, BoxConstraints constraints) {
      //     return FlexibleSpaceBar(
      //       titlePadding: EdgeInsets.all(0),
      //       centerTitle: true,
      //       //(kToolbarHeight + MediaQuery.of(context).padding.top) is the appbar height + the status bar
      //       //(constraints.biggest.height) it gives you the height of it is child
      //       // title: kToolbarHeight + MediaQuery.of(context).padding.top ==
      //       //         constraints.biggest.height
      //       //     ? Image.asset(
      //       //         "assets/images/splash_screen/logo-small.png",
      //       //         height: 80.w,
      //       //         width: 80.w,
      //       //       )
      //       //     : Container(),
      //       title: Container(
      //         color: Colors.red,
      //         child: Text("fish"),
      //       ),
      //       background: Column(
      //         children: [
      //           // Flexible(
      //           //   flex: 3,
      //           //   child: Image.asset(
      //           //     'assets/images/place_holders/logo_placeholder.png',
      //           //     fit: BoxFit.fitWidth,
      //           //     width: double.infinity,
      //           //   ),
      //           // ),
      //           Flexible(
      //             flex: 1,
      //             child: Consumer(
      //               builder:
      //                   (BuildContext context, WidgetRef ref, Widget? child) {
      //                 List<CategoryModel> categories =
      //                     (ref.watch(productsDataProvider) as DataLoaded)
      //                         .categories;
      //                 return ListView(
      //                     scrollDirection: Axis.horizontal,
      //                     // shrinkWrap: true,
      //                     children: categories.mapIndexed((index, category) {
      //                       return GestureDetector(
      //                         onTap: () {},
      //                         child: Container(
      //                           margin: EdgeInsets.only(
      //                             left: 10.w,
      //                             right: 5.w,
      //                           ),
      //                           padding: EdgeInsets.symmetric(horizontal: 15.w),
      //                           decoration: BoxDecoration(
      //                             color: Colors.black,
      //                             borderRadius: BorderRadius.circular(15.w),
      //                           ),
      //                           child: Center(
      //                             child: Text(
      //                               category.name,
      //                               style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontFamily: "Avenir-Book",
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       );
      //                     }).toList());
      //               },
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
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
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Image.network(category.image.getThumbnailImage()),
                      SizedBox(
                        width: 10.w,
                      ),
                      Center(
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Avenir-Book",
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
