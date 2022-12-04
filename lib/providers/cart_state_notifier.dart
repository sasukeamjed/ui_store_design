import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/chosen_product_state/product_state.dart';

class CartStateNotifier extends StateNotifier<List<CartItem>>{
  CartStateNotifier() : super([]);


  addProduct(CartItem cartItem){
    state.add(cartItem);
  }

  deleteProduct(CartItem cartItem){
    state.remove(cartItem);
  }

  addQuantity(CartItem item){
    int indexOfCartItem = state.indexOf(item);
    state[indexOfCartItem] = state[indexOfCartItem].copyWithAddExtraQuantity();
  }

  calculateTotalPrice(){}
}

class CartItem{
  final int quantity;
  final ProductIsChosen productIsChosen;


  CartItem({this.quantity = 1, required this.productIsChosen});

  CartItem copyWithAddExtraQuantity(){
    return CartItem(productIsChosen: productIsChosen, quantity: this.quantity + 1);
  }
}