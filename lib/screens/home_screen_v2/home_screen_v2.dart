import 'package:flutter/material.dart';

class HomeScreenV2 extends StatelessWidget {
  static String routeName = "/home_v2";
  const HomeScreenV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Screen V2'),
      ),
    );
  }
}
