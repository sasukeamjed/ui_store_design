import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/screens/search_page/search_page.dart';

class ShopSliverAppBar extends StatelessWidget {


  const ShopSliverAppBar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 4,
      forceElevated: true,
      snap: false,
      pinned: true,
      floating: false,
      expandedHeight: 250.h,
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
        IconButton(
          icon: Icon(
            Icons.search,
            size: 24.w,
          ),
          tooltip: 'Search Icon',
          onPressed: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(),
            );
          },
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0),
            centerTitle: true,
            //(kToolbarHeight + MediaQuery.of(context).padding.top) is the appbar height + the status bar
            //(constraints.biggest.height) it gives you the height of it is child
            title: kToolbarHeight + MediaQuery.of(context).padding.top ==
                    constraints.biggest.height
                ? Image.network(
                    vendor.vendorShopLogo,
                    height: 80.w,
                    width: 80.w,
                  )
                : Container(),
            //Text
            background: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/place_holders/logo_placeholder.png',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0.w,
                      vertical: 15.h,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shop: This is shop name?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Contact Email: info@4ustore.net",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/place_holders/logo_placeholder.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    children: vendor.getCategories().mapIndexed((index,categoryName){
                      return GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10.w,
                            right: 5.w,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.w),
                          ),
                          child: Center(
                            child: Text(
                              categoryName,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Avenir-Book",
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          );
        },
      ),
    );
  }
}
