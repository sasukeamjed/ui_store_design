

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
