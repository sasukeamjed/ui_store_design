import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "New Arrivals",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 24.sp,
                ),
              ),
              Spacer(),
              Text(
                "Show all",
                style: TextStyle(fontFamily: "Avenir-Book", fontSize: 15.sp),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 220.h,
            // child: ListView.builder(
            //   shrinkWrap: true,
            //   scrollDirection: Axis.horizontal,
            //   // itemCount: products.length,
            //   itemBuilder: (context, index) {
            //     return Container();
            //     // return GestureDetector(
            //     //   child: NewArrivalItem(product: products[index]),
            //     //   onTap: () =>
            //     //       Navigator.of(context).pushNamed(DetailsScreen2.routeName),
            //     // );
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}

class NewArrivalItem extends StatefulWidget {
  const NewArrivalItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<NewArrivalItem> createState() => _NewArrivalItemState();
}

class _NewArrivalItemState extends State<NewArrivalItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                widget.product.img,
                width: 140.w,
                height: 140.h,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.product.isFavorited = !widget.product.isFavorited;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: widget.product.isFavorited
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.product.title,
            style: TextStyle(fontFamily: "Avenir", fontSize: 17.sp),
          ),
          Text(
            "\$${widget.product.price}",
            style: TextStyle(
                fontFamily: "Avenir-Book",
                fontSize: 15.sp,
                color: Colors.black.withOpacity(0.4)),
          ),
        ],
      ),
    );
  }
}
