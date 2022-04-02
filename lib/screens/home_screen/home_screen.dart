import 'package:flutter/cupertino.dart';
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
      appBar: AnimatedAppBar(),
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

  PreferredSize animatedSearchBar(bool isSearching, GestureTapCallback press) {
    bool animationCompleted = false;
    double contWidth = 0;
    print(isSearching);
    return PreferredSize(
      child: SafeArea(
        child: Container(
          // margin: EdgeInsets.only(top: WidgetsBinding.instance!.window.padding.top),
          height: AppBar().preferredSize.height,
          color: Colors.green,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isSearching)
                  AnimatedContainer(
                    onEnd: () {
                      setState(() {
                        animationCompleted = true;
                      });
                    },
                    color: Colors.white,
                    width: contWidth,
                    height: 10,
                    duration: Duration(seconds: 5),
                  ),
                if (!isSearching) ...[
                  Icon(Icons.shopping_cart),
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: press,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      // preferredSize: Size.fromHeight(56),
    );
  }

  PreferredSize customAppBar() {
    return PreferredSize(
      child: SafeArea(
        child: Container(
          // margin: EdgeInsets.only(top: WidgetsBinding.instance!.window.padding.top),
          height: AppBar().preferredSize.height,
          color: Colors.green,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width - 50,
                  height: 10,
                ),
                Icon(Icons.shopping_cart),
                Icon(Icons.search),
              ],
            ),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      // preferredSize: Size.fromHeight(56),
    );
  }
}

class AnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AnimatedAppBar({Key? key}) : super(key: key);

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  late double _contWidth;
  late bool _isSearching;
  late bool _animationCompleted;

  @override
  void initState() {
    // _contWidth = 0;
    _isSearching = false;
    _animationCompleted = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: AppBar().preferredSize.height,
        color: Colors.green,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  // onEnd: () {
                  //   setState(() {
                  //     _animationCompleted = true;
                  //   });
                  // },
                  color: Color(0xFFededed),
                  // width: double.infinity,
                  // width: _isSearching
                  //     ? _contWidth = MediaQuery.of(context).size.width
                  //     : _contWidth = 0,
                  height: AppBar().preferredSize.height,
                  // duration: Duration(
                  //   seconds: 1,
                  // ),
                  // curve: Curves.easeOut,
                  // child: _animationCompleted
                  //     ? CupertinoSearchTextField()
                  //     : SizedBox(),
                  child: _isSearching
                      ? CupertinoSearchTextField(decoration: BoxDecoration(color: Color(0xFFededed)),)
                      : SizedBox(),
                ),
              ),
              if (!_isSearching) ...[
                Icon(Icons.shopping_cart),
                GestureDetector(
                  child: Icon(Icons.search),
                  onTap: () {
                    setState(() {
                      _isSearching = true;
                      _contWidth = MediaQuery.of(context).size.width;
                    });
                  },
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
