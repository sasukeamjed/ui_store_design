import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/cart_state_notifier.dart';

final cartItemsTotalPriceProvider = Provider<double>((ref){
  final cartState = ref.watch(cartItemNotifier);

  double totalPrice = 0.00;
  if(cartState.isNotEmpty){
    cartState.forEach((cartItem) {
      totalPrice = totalPrice + (double.parse(cartItem.productIsChosen.price) * cartItem.quantity);
    });
    return totalPrice;
  }else{
    totalPrice = 0.00;
  }
  return totalPrice;

});