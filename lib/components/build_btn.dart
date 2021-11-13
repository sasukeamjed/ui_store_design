import 'package:flutter/material.dart';
import 'package:ui_store_design/size_config.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key, required this.press, required this.text,
  }) : super(key: key);

  final GestureTapCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(44),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Avenir",
              fontSize: getProportionateScreenWidth(15)),
        ),
        onPressed: press,
      ),
    );
  }
}
