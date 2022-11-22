import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/extensions.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/chosen_product_state/chosen_product_notifier.dart';
import 'package:ui_store_design/providers/chosen_product_state/product_state.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/shopping_cart.dart';
import 'package:ui_store_design/screens/details_screen_2/helper_methods/helper_methods.dart';

class AddToCartBar extends StatelessWidget {
  const AddToCartBar({
    Key? key, required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: kToolbarHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Icon(Icons.favorite_border),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              flex: 4,
              child: Container(
                // width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: Consumer(
                  builder: (context, ref, child){
                    final ProductState productState = ref.watch(productIsChosenNotifier(product));
                    return TextButton(
                      style: ButtonStyle(
                        backgroundColor: productState is ProductIsChosen ? MaterialStateColor.resolveWith((states) => Colors.transparent) : MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      child: Text(
                        "Add To Cart +",
                        style: TextStyle(fontFamily: "Avenir", fontSize: 15.sp),
                      ),
                      onPressed: () {
                        // print("product cart state => ${productState.runtimeType}");
                        if(productState is ProductIsChosen){
                          Navigator.of(context).pushNamed(ShoppingCart.routeName);
                        }
                        else{
                          final snackBar = SnackBar(
                            content: Text('Please, Choose Your Product ${product.getOptions().keys.map((keyName) => removeAttributePa(keyName).capitalize()).join(" and ")}.'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                      },
                    );
                  },
                  // child: TextButton(
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                  //   ),
                  //   child: Text(
                  //     "Add To Cart +",
                  //     style: TextStyle(fontFamily: "Avenir", fontSize: 15.sp),
                  //   ),
                  //   onPressed: () {
                  //     final snackBar = SnackBar(
                  //       content: Text('Please, Choose Your Product ${product.getOptions().keys.map((keyName) => removeAttributePa(keyName).capitalize()).join(" and ")}.'),
                  //     );
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //     // Navigator.of(context).pushNamed(ShoppingCart.routeName);
                  //   },
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
