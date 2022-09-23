import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/services/data/data.dart';

class NewArrivalsSection extends ConsumerWidget {
  const NewArrivalsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
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
            height: 260.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: NewArrivalItem(product: ref.read(dataProvider.notifier).sortProductsByDate()[index]),
                  onTap: () =>
                      Navigator.of(context).pushNamed(DetailsScreen2.routeName),
                );
              },
            ),
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
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  widget.product.img,
                  width: 140.w,
                  height: 140.h,
                  fit: BoxFit.fill,
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
            AutoSizeText(
              widget.product.title,
              style: TextStyle(fontFamily: "Avenir", fontSize: 17.sp),
              maxLines: 2,
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
      ),
    );
  }
}
