import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ui_store_design/screens/login_screen/login.dart';

import 'componenets/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  late bool _isSearching;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  _stopSearching() {
    if (_searchController.text.isEmpty) {
      setState(() {
        _isSearching = false;
      });
    }
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    _isSearching = false;

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_searchController.text.isEmpty) {
          setState(() {
            _isSearching = false;
          });
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AnimatedAppBar(
          searchController: _searchController,
          isSearching: _isSearching,
          scaffoldKey: _scaffoldKey,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  title: Text("Login in"),
                  leading: Icon(Icons.person),
                  onTap: (){
                    Navigator.pop();
                  },
                ),
              ),
            ],
          ),
        ),
        body: Body(
          stopSearchCallBack: _stopSearching,
        ),
      ),
    );
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
  final TextEditingController searchController;
  final GlobalKey<ScaffoldState> scaffoldKey;
  bool isSearching;

  AnimatedAppBar(
      {Key? key,
      required this.searchController,
      required this.isSearching,
      required this.scaffoldKey})
      : super(key: key);

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Container(
          color: Color(0xFFededed),
          height: AppBar().preferredSize.height,
          child: widget.isSearching
              ? CupertinoSearchTextField(
                  onSuffixTap: () {
                    setState(() {
                      widget.searchController.clear();
                      widget.isSearching = false;
                    });
                  },
                  autofocus: true,
                  controller: widget.searchController,
                  decoration: BoxDecoration(
                    color: Color(0xFFededed),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Icon(Icons.menu),
                        onTap: () {
                          widget.scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                      Spacer(),
                      Icon(Icons.shopping_cart),
                      SizedBox(
                        width: 20.w,
                      ),
                      GestureDetector(
                        child: Icon(Icons.search),
                        onTap: () {
                          setState(() {
                            widget.isSearching = true;
                          });
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
