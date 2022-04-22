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

  _startSearching(){
    setState(() {
      _isSearching = true;
    });
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
          print("inside HomeScreen built method issearching = ${_isSearching}");
          setState(() {
            _isSearching = false;
          });
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AnimatedAppBar(
          stopSearchCallBack: _stopSearching,
          startSearchCallBack: _startSearching,
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
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, LoginScreen.routeName);
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

}

class AnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final GlobalKey<ScaffoldState> scaffoldKey;
  bool isSearching;
  final Function stopSearchCallBack;
  final Function startSearchCallBack;

  AnimatedAppBar(
      {Key? key,
      required this.searchController,
      required this.isSearching,
      required this.scaffoldKey,
      required this.stopSearchCallBack,
      required this.startSearchCallBack,})
      : super(key: key);

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {

  @override
  Widget build(BuildContext context) {
    print("inside animated appbar built method issearching = ${widget.isSearching}");
    return SafeArea(
      child: SafeArea(
        child: Container(
          color: Color(0xFFededed),
          height: AppBar().preferredSize.height,
          child: widget.isSearching
              ? CupertinoSearchTextField(
                  onSuffixTap: () {
                    widget.searchController.clear();
                    widget.stopSearchCallBack();
                    // setState(() {
                    //   widget.searchController.clear();
                    //   widget.isSearching = false;
                    // });
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
                            widget.startSearchCallBack();
                            // widget.isSearching = true;
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
