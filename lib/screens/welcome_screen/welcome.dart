import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/providers/search_providers.dart';
import 'package:ui_store_design/screens/home_screen/home_screen.dart';
import 'package:ui_store_design/screens/welcome_screen/components/body.dart';
import 'package:ui_store_design/secure_storage/secure_and_store_user_data.dart';
import 'package:ui_store_design/services/auth/auth.dart';
import 'package:ui_store_design/services/data/data.dart';
import 'package:ui_store_design/size_config.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class WelcomeScreen extends ConsumerStatefulWidget {

  static String routeName = "/welcome";

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  late Widget _mainBody;
  late int _status;
  @override
  void initState() {
    super.initState();
    _mainBody = Body();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.

    //check if there is token stored or not
    print('getting user data');
    String? token = await UserDataSecureStorage.getUserToken();
    print('user data is ready: $token');

    //fetching all the products and filtering them to their respective vendors
    await ref.read(dataProvider.notifier).dataInit();
    await ref.read(searchHistoryProvider.notifier).searchHistory("");
    if(token != ""){
      Map<String, dynamic> response = await ref.read(authProvider.notifier).tokenVerification(token!);
      if(response['data']['status'] == 200){
        setState(() {
          _mainBody = HomeScreen();
        });
      }
    }

    if(ref.watch(dataProvider) != null && ref.watch(dataProvider)!.isNotEmpty){
      FlutterNativeSplash.remove();
    }


    print('go!');
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return _mainBody;
  }
}
