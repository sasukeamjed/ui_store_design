import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/search_page/search_page.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/shopping_cart.dart';


class ChangableAppBar extends StatefulWidget implements PreferredSizeWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;


  ChangableAppBar(
      {Key? key,
        required this.scaffoldKey,
      })
      : super(key: key);

  @override
  State<ChangableAppBar> createState() => _ChangableAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _ChangableAppBarState extends State<ChangableAppBar> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        color: Color(0xFFededed),
        height: AppBar().preferredSize.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(

            children: [
              GestureDetector(
                child: Icon(Icons.menu, size: 25.w,),
                onTap: () {
                  widget.scaffoldKey.currentState!.openDrawer();
                },
              ),
              Spacer(),
              GestureDetector(
                child: Icon(Icons.shopping_cart, size: 25.w,),
                onTap: () {
                  Navigator.of(context).pushNamed(ShoppingCart.routeName);
                },
              ),
              // IconButton(
              //   padding: EdgeInsets.all(0),
              //   icon: Icon(Icons.shopping_cart, size: 25.w,),
              //   onPressed: (){
              //     Navigator.of(context).pushNamed(ShoppingCart.routeName);
              //   },
              // ),
              SizedBox(
                width: 15.w,
              ),
              GestureDetector(
                child: Icon(Icons.search, size: 25.w,),
                onTap: () {
                      showSearch(
                        context: context,
                        delegate: MySearchDelegate(),
                      );
                },
              ),
              // IconButton(
              //   padding: EdgeInsets.all(0),
              //   alignment: Alignment.centerRight,
              //   icon: Icon(Icons.search, size: 25.w,),
              //   onPressed: () {
              //     showSearch(
              //       context: context,
              //       delegate: MySearchDelegate(),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
