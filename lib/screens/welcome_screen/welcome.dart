import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/screens/home_screen/home_screen.dart';
import 'package:ui_store_design/screens/welcome_screen/components/body.dart';
import 'package:ui_store_design/secure_storage/secure_and_store_user_data.dart';
import 'package:ui_store_design/services/auth/auth.dart';
import 'package:ui_store_design/size_config.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class WelcomeScreen extends ConsumerStatefulWidget {

  static String routeName = "/welcome";

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('getting user data');
    print(await UserDataSecureStorage.getUserToken());
    print('user data is ready');
    Response response = await ref.read(authProvider.notifier).tokenVerification("token");
    if(response.data['data']['status'] == 200){
      print("status is 200");
    }
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }
  //This function returns a widget according to the status code returned from authrizing header
  Widget _authTokenPage(){
    return statusCode == 200 ? HomeScreen() : Body();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: _authTokenPage(),
    );
  }
}
