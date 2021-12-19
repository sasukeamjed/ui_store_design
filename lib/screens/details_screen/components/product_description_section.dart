import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/screens/details_screen/components/product_details.dart';
import 'package:ui_store_design/screens/details_screen/components/scrolled_titles.dart';

class ProductDescriptionSection extends StatefulWidget {
  const ProductDescriptionSection({Key? key}) : super(key: key);

  @override
  State<ProductDescriptionSection> createState() =>
      _ProductDescriptionSectionState();
}

class _ProductDescriptionSectionState extends State<ProductDescriptionSection> {
  late PageController _pageController;
  late ScrollController _scrollController;
  int initialProductDetailsPage = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    _scrollController = ScrollController();
    super.initState();
  }

  void goToReviewPage() {
    _pageController.animateToPage(1,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void goToDesPage() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void goToAddInfoPage() {
    _pageController.animateToPage(2,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ScrolledTitles(
            scrollController: _scrollController,
            initialProductDetailsPage: initialProductDetailsPage,
            reviewTap: goToReviewPage,
            desTap: goToDesPage,
            addInfoTap: goToAddInfoPage,
          ),
          Container(
            color: Colors.black.withOpacity(0.05),
            width: double.infinity,
            height: 1,
          ),
          SizedBox(
            height: 24.5.h,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int page) {
                final double end = (_scrollController.position.maxScrollExtent);
                final double start = 0;

                if (page == 0 || page == 1) {
                  _scrollController.animateTo(start,
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeIn);
                }
                if (page == 2) {
                  _scrollController.animateTo(end,
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeIn);
                }

                setState(() {
                  initialProductDetailsPage = page;
                });
              },
              children: [
                ProductDetails(),
                PageTwo(),
                PageThree(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Tow")),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("three")),
    );
  }
}
