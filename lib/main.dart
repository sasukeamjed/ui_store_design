import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/routes.dart';
import 'package:ui_store_design/screens/home_screen/home_screen.dart';
import 'package:ui_store_design/screens/login_screen/login.dart';
import 'package:ui_store_design/screens/welcome_screen/welcome.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child){
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
            textTheme: TextTheme(
              titleMedium: TextStyle(
                  fontFamily: "Avenir",
              ),
              labelMedium: TextStyle(
                  fontFamily: "Avenir",
              ),
              labelSmall: TextStyle(
                  fontFamily: "Avenir-Book"
              ),
            ),
            // iconTheme: IconThemeData(
            //   color: Colors.black,
            // ),
          ),
          initialRoute: WelcomeScreen.routeName,
          routes: routes,
        );
      },
    );
  }
}

