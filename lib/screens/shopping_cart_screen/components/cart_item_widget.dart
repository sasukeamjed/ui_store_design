import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/providers/cart_state_notifier.dart';
import 'package:ui_store_design/screens/details_screen_2/helper_methods/helper_methods.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {Key? key,
        // required this.itemsCount,
        required this.cartItem})
      : super(key: key);


  // final int itemsCount;
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    print("cart_item_widget this is the product options => ${cartItem.productIsChosen.product.getOptions()}");
    return SizedBox(
      height: 120.h,
      child: Row(
        //ToDo: import product data
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: _buildCartItemImage(
              image: cartItem.productIsChosen.product.thumbnailImages[0],
              itemsCount: 0,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black.withOpacity(0.25),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    cartItem.productIsChosen.product.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: "Avenir",
                    ),
                  ),
                  Text(
                    "\$${cartItem.productIsChosen.product.price}",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 15.sp,
                      fontFamily: "Avenir-Book",
                    ),
                  ),
                  _generateProductOptions(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: double.infinity,
              child: Consumer(
                builder: (context, ref, child) {

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Icon(Icons.add, color: Colors.white,),
                          decoration: BoxDecoration(
                            color: Color(0xff64A34A),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0,2),
                                blurRadius: 3,
                                spreadRadius: 0.1,
                              ),
                            ],
                          ),
                        ),
                        onTap: (){
                          ref.read(cartItemNotifier.notifier).addQuantity(cartItem);
                        },
                      ),
                      Text(cartItem.quantity.toString()),
                      Container(
                        child: Icon(Icons.remove, color: Colors.white,),
                        decoration: BoxDecoration(
                          color: Color(0xff64A34A),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0,2),
                              blurRadius: 3,
                              spreadRadius: 0.1,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }

  Row _generateProductOptions(){

    return Row(
      children: cartItem.productIsChosen.product.getOptions().entries.map((entry){
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "${removeAttributePa(entry.key)} : ", style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 15.sp,
                fontFamily: "Avenir-Book",
              )),
              TextSpan(text: entry.value[0], style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: "Avenir-Book",
              ),)
            ],
          ),
        );
      }).toList(),
    );
  }

  Stack _buildCartItemImage({required String image, required int itemsCount}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            image,
            height: 88.w,
            width: 88.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Container(
            height: 18.w,
            width: 18.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Center(
                child: Text(
                  cartItem.quantity.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Avenir-Medium",
                    fontSize: 11.sp,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}


