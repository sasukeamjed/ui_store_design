import 'package:flutter/material.dart';
import 'package:ui_store_design/routes.dart';
import 'package:ui_store_design/screens/welcome_screen/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontFamily: "Avenir"),
            primary: Colors.white,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0)
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
        // iconTheme: IconThemeData(
        //   color: Colors.black,
        // ),
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}

