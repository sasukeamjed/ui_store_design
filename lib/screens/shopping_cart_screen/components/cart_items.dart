import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/cart_state_notifier.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/components/cart_item_widget.dart';

class CartItems extends ConsumerStatefulWidget{

  @override
  ConsumerState <CartItems>createState() => _CartItemsState();
}

class _CartItemsState extends ConsumerState<CartItems> {


  Future<void> _showMyDialog(BuildContext context, CartItem cartItem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Item Will Be Removed From Cart?'),
          content: SingleChildScrollView(
            child: Column(
              // mainAxis: Axis.horizontal,
              children: <Widget>[
                Image.network(
                  cartItem.productIsChosen.product.thumbnailImages[0],
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(cartItem.productIsChosen.product.title),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Keep'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black26),
              ),
              onPressed: () {
                ref.read(cartItemNotifier.notifier).addQuantity(cartItem.cartItemId);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                ref.read(cartItemNotifier.notifier).deleteCartItem(cartItem.cartItemId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      flex: 8,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.orange,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  "${ref.watch(cartItemNotifier).length} items",
                  style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                // color: Colors.blue,
                child: ListView.builder(
                  itemCount: ref.watch(cartItemNotifier).length,
                  itemBuilder: (context, index) {
                    final cartItem = ref.watch(cartItemNotifier)[index];
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      if(cartItem.quantity == 0){
                        print("cart item is 0");
                        _showMyDialog(context, cartItem);
                      }
                    });

                    return Padding(
                      padding: EdgeInsets.only(bottom: 15.0.h),
                      child: Dismissible(
                        //ToDo: add id key for dismissible widget
                        key: Key(ref.read(cartItemNotifier)[index].cartItemId.toString()),
                        direction: DismissDirection.endToStart,
                        background: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 15.w),
                            height: 62.w,
                            width: 62.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFF2D55),
                            ),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                        child: CartItemWidget(
                          cartItem: ref.read(cartItemNotifier)[index],
                        ),
                        //ToDo: Check on dismissed bug
                        onDismissed: (DismissDirection direction){
                          final cartItemId = ref.read(cartItemNotifier)[index].cartItemId;
                          ref.read(cartItemNotifier.notifier).deleteCartItem(cartItemId);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


