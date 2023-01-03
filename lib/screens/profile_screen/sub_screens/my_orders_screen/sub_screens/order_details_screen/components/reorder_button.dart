

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReorderButton extends StatelessWidget {
  const ReorderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text("Reorder"),
      onPressed: (){},
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          minimumSize: Size.fromHeight(45.w),
          side: BorderSide(
            color: Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );
  }
}



