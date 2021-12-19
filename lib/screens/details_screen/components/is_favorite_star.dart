import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsFavoriteStar extends StatelessWidget {
  const IsFavoriteStar({Key? key, this.isFavorite = true}) : super(key: key);

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: isFavorite ? Color(0xFFFF8900) : Color(0xFFE1E4E8),
      size: 20.w,
    );
  }
}