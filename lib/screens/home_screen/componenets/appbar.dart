

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangableAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final GlobalKey<ScaffoldState> scaffoldKey;
  bool isSearching;
  final Function stopSearchCallBack;
  final Function startSearchCallBack;
  final Function searchFunction;

  ChangableAppBar(
      {Key? key,
        required this.searchController,
        required this.isSearching,
        required this.scaffoldKey,
        required this.stopSearchCallBack,
        required this.startSearchCallBack, required this.searchFunction,})
      : super(key: key);

  @override
  State<ChangableAppBar> createState() => _ChangableAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _ChangableAppBarState extends State<ChangableAppBar> {

  @override
  Widget build(BuildContext context) {
    // print("inside animated appbar built method issearching = ${widget.isSearching}");
    //ToDo: Adding the cashing search functionality so the user can know what he searched previously
    return SafeArea(
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
          onChanged: (String searchValue)=> widget.searchFunction,
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
    );
  }
}
