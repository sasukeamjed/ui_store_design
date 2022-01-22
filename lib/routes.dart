import 'package:flutter/widgets.dart';
import 'package:ui_store_design/screens/checkout_screen/checkout.dart';
import 'package:ui_store_design/screens/details_screen/details.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/forgot_password_screen/forgot_password.dart';
import 'package:ui_store_design/screens/home_screen/home_screen.dart';
import 'package:ui_store_design/screens/login_screen/login.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/shopping_cart.dart';
import 'package:ui_store_design/screens/signup_screen/signup.dart';
import 'package:ui_store_design/screens/welcome_screen/welcome.dart';

Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName : (context)=>WelcomeScreen(),
  LoginScreen.routeName : (context)=>LoginScreen(),
  ForgotPasswordScreen.routeName : (context)=>ForgotPasswordScreen(),
  SignUpScreen.routeName : (context)=>SignUpScreen(),
  HomeScreen.routeName : (context)=>HomeScreen(),
  DetailsScreen.routeName : (context)=>DetailsScreen(),
  DetailsScreen2.routeName : (context)=>DetailsScreen2(),
  ShoppingCart.routeName : (context)=>ShoppingCart(),
  Checkout.routeName : (context)=>Checkout(),
};