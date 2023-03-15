import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/search_page/search_delegate_custom_class.dart';
import 'package:ui_store_design/screens/search_page/search_page.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.focusNode,
    this.queryTextController,
    this.showResults,
    this.isActive = true,
  }) : super(key: key);

  final FocusNode? focusNode;
  final TextEditingController? queryTextController;
  final Function(String)? showResults;
  final isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.w,
      child: GestureDetector(
        onTap: (){
          if(!this.isActive){
            customShowSearchFunction(
              context: context,
              delegate: MySearchDelegate(),
            );
          }
        },
        child: TextField(
          controller: queryTextController,
          focusNode: this.isActive ? focusNode : null,
          onSubmitted: this.isActive ? showResults : (val){},
          enabled: this.isActive,
          decoration: InputDecoration(
            hintText: 'Interested on searching for something?',
            hintStyle: TextStyle(
                fontFamily: "Avenir", fontSize: 14.sp, letterSpacing: 1),
            suffixIcon: Icon(
              Icons.search,
              size: 28.w,
            ),
            isCollapsed: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            filled: true,
            fillColor: Colors.green.shade100,
            contentPadding: EdgeInsets.only(left: 10.w),
          ),
        ),
      ),
    );
  }
}
