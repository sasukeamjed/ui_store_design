import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrolledTitles extends StatelessWidget {
  const ScrolledTitles({
    Key? key,
    required ScrollController scrollController,
    required this.initialProductDetailsPage,
  }) : _scrollController = scrollController, super(key: key);

  final ScrollController _scrollController;
  final int initialProductDetailsPage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: initialProductDetailsPage == 0 ? Colors.black : Colors.transparent,
                    width: 2.5,
                  ),
                ),
              ),
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: "Avenir",
                  height: 1.5,
                  color: initialProductDetailsPage == 0 ? Colors.black : Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.w),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: initialProductDetailsPage == 1 ? Colors.black : Colors.transparent,
                      width: 2.5,
                    ),
                  ),
                ),
                child: Text(
                  "Review",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: "Avenir-Roman",
                    color: initialProductDetailsPage == 1 ? Colors.black : Colors.black.withOpacity(0.5),
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: initialProductDetailsPage == 2 ? Colors.black : Colors.transparent,
                    width: 2.5,
                  ),
                ),
              ),
              child: Text(
                "Additional information",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: "Avenir-Roman",
                  color: initialProductDetailsPage == 2 ? Colors.black : Colors.black.withOpacity(0.5),
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}