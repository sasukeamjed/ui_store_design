import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/vendor_model.dart';

class VendorSliverAppBar extends StatelessWidget {

  final Vendor vendor;

  const VendorSliverAppBar({Key? key, required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 4,
      forceElevated: true,
      snap: true,
      pinned: true,
      floating: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0),
            centerTitle: true,
            //(kToolbarHeight + MediaQuery.of(context).padding.top) is the appbar height + the status bar
            //(constraints.biggest.height) it gives you the height of it is child
            title: kToolbarHeight + MediaQuery.of(context).padding.top == constraints.biggest.height? Image.network(
              vendor.vendorShopLogo,
              height: 80,
              width: 80,
            ) : Container(), //Text
            background: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.network(
                    vendor.mobileBanner,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w, vertical: 15.h),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: FittedBox(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shop: ${vendor.vendorShopName}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Location: ${vendor.vendorAddress}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Phone Number: ${vendor.vendorPhone}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Contact Email: info@4ustore.net",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Flexible(
                          flex: 1,
                          child: Image.network(
                              vendor.vendorShopLogo),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      //FlexibleSpaceBar
      expandedHeight: 230,
      backgroundColor: Colors.grey,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.filter_list),
          tooltip: 'Setting Icon',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Comment Icon',
          onPressed: () {},
        ),
      ],
    );
  }
}

