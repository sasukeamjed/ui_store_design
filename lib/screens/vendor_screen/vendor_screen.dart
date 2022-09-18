import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({Key? key}) : super(key: key);
  static String routeName = "/home_v2";

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
                title: Image.asset(
                  "assets/images/splash_screen/logo-small.png",
                  height: 80,
                  width: 80,
                ), //Text
                background: Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h,),
                      Text(
                        "Shop: 4U Store",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "Location: Nizwa",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "Phone Number: 95868408",
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
                  icon: Icon(Icons.location_on_outlined),
                  tooltip: 'Setting Icon',
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.comment),
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
