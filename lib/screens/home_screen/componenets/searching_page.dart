import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchingPage extends StatelessWidget {
  const SearchingPage(this._searchValue);

  final String _searchValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFededed),
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Search for your shop name or your product..."),
            SizedBox(height: 10.h,),
            Text("Search value results => $_searchValue"),
          ],
        ),
      ),
    );
  }
}
