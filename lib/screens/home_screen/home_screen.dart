import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'componenets/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool _isSearching;

  @override
  void initState() {
    _isSearching = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xFFF0F0F0),
      appBar: customAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            Text("Drawer"),
          ],
        ),
      ),
      body: Body(),
    );
  }

  PreferredSize defaultAppBar() {
    return PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xFFF0F0F0),
          elevation: 0.0,
          actions: [
            GestureDetector(
              child: Icon(Icons.search),
              onTap: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              },
            ),
            if (!_isSearching) ...[
              SizedBox(
                width: 20.w,
              ),
              Icon(Icons.shopping_basket_outlined),
            ],
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        preferredSize: AppBar().preferredSize);
  }

  PreferredSize customAppBar() {
    return PreferredSize(
      child: Container(
        // margin: EdgeInsets.only(top: WidgetsBinding.instance!.window.padding.top),
        height: AppBar().preferredSize.height,
        color: Colors.green,
        child: SafeArea(
          child: Row(
            children: [
              Icon(Icons.search),
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }
}
