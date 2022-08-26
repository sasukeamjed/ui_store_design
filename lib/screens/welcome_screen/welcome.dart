import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/screens/welcome_screen/components/body.dart';
import 'package:ui_store_design/services/auth/auth.dart';
import 'package:ui_store_design/size_config.dart';

class WelcomeScreen extends ConsumerWidget {

  static String routeName = "/welcome";

  @override
  Widget build(BuildContext context, ref) {
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}
