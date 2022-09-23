import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/vendor_model.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({Key? key, required this.vendor}) : super(key: key);
  // static String routeName = "/vendor_screen";
  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              snap: true,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(0),
                centerTitle: true,
                // title: Image.network(
                //   vendor.vendorShopLogo,
                //   height: 80,
                //   width: 80,
                // ), //Text
                background: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.network(vendor.mobileBanner, fit: BoxFit.fitWidth, width: double.infinity,),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Shop: ${vendor.vendorShopName}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 10.h,),
                                Text(
                                  "Location: ${vendor.vendorAddress}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                Text(
                                  "Phone Number: ${vendor.vendorPhone}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                Text(
                                  "Contact Email: info@4ustore.net",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ), //Images.network
              ),
              //FlexibleSpaceBar
              expandedHeight: 230,
              backgroundColor: Colors.greenAccent[400],
              leading: IconButton(
                icon: Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: () {},
              ),
              //IconButton
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
              ], //<Widget>[]
            ), //SliverAppBar
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
                  title: Center(
                    child: Text('$index',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 50,
                            color: Colors.greenAccent[400]) //TextStyle
                        ), //Text
                  ), //Center
                ), //ListTile
                childCount: 51,
              ), //SliverChildBuildDelegate
            ) //SliverList
          ], //<Widget>[]
        ),
      ),
    );
  }
}
