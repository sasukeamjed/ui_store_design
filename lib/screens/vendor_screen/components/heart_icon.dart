import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {

  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 90.w,
      child: GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 3.0,
              ),
            ],
          ),
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: _isLiked ? Icon(Icons.favorite, color: Colors.green,) : Icon(Icons.favorite_border),
            ),
          ),
        ),
        onTap: (){
          setState(() {
            _isLiked = !_isLiked;
          });
        },
      ),
    );
  }
}
