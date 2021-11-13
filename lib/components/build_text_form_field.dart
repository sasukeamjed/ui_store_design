import 'package:flutter/material.dart';
import 'package:ui_store_design/size_config.dart';

class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField({
    Key? key, required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            fontFamily: "Avenir-Book",
            fontSize: getProportionateScreenWidth(17),
            color: Color(0xFF000000).withOpacity(0.4)),
      ),
    );
  }
}