import 'package:flutter/material.dart';

class SearchingPage extends StatelessWidget {
  const SearchingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFededed),
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Text("Search for your shop name or your product..."),
      ),
    );
  }
}
