import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          print("validator is null");
          return 'Please enter your $hint';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: "Avenir-Book",
          fontSize: 17.sp,
          // fontSize: getProportionateScreenWidth(17),
          color: Color(0xFF000000).withOpacity(0.4),
        ),
        errorStyle: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}
