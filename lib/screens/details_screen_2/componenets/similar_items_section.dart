import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';

class SimilarItemsSection extends StatelessWidget {
  const SimilarItemsSection({
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
          SizedBox(
            height: 280.h,
            // child: ListView.builder(
            //   shrinkWrap: true,
            //   scrollDirection: Axis.horizontal,
            //   // itemCount: products.length,
            //   itemBuilder: (context, index){
            //     return Container();
            //     // return GestureDetector(child: SimilarItem(product: products[index]), onTap: ()=> Navigator.of(context).pushNamed(DetailsScreen2.routeName),);
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}

class SimilarItem extends StatefulWidget {
  const SimilarItem({
    Key? key, required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<SimilarItem> createState() => _SimilarItemState();
}

class _SimilarItemState extends State<SimilarItem> {
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
                widget.product.images[0], width: 165.w, height: 200.h, fit: BoxFit.cover,),
              Positioned(
                right: 1,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      widget.product.isFavorited = !widget.product.isFavorited;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: widget.product.isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 17.h,),
          Text(widget.product.title, style: TextStyle(fontFamily: "Avenir", fontSize: 17.sp),),
          Text("\$${widget.product.price}", style: TextStyle(fontFamily: "Avenir-Book", fontSize: 15.sp, color: Colors.black.withOpacity(0.4)),),
        ],
      ),
    );
  }
}

