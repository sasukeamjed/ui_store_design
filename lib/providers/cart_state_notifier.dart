import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/chosen_product_state/product_state.dart';
import 'package:uuid/uuid.dart';

class CartStateNotifier extends StateNotifier<List<CartItem>>{
  CartStateNotifier() : super([]);


  addCartItem(CartItem cartItem){
    state = [...state, cartItem];
    print("cart_state_notifier cart item is added");
    print("cart_state_notifier cart items length => ${state.length}");
  }

  deleteCartItem(Uuid cartItemId){
    state = [
      for (final cartItem in state)
        if(cartItemId != cartItem.cartItemId) cartItem,
    ];
  }

  addQuantity(CartItem item){
    int indexOfCartItem = state.indexOf(item);
    state[indexOfCartItem] = state[indexOfCartItem].copyWithAddExtraQuantity();
  }

  calculateTotalPrice(){}
}

class CartItem{
  late final Uuid cartItemId;
  final int quantity;
  final ProductIsChosen productIsChosen;


  CartItem({this.quantity = 1, required this.productIsChosen}){
    cartItemId = Uuid();
  }

  CartItem copyWithAddExtraQuantity(){
    return CartItem(productIsChosen: productIsChosen, quantity: this.quantity + 1);
  }
}

final cartItemNotifier = StateNotifierProvider<CartStateNotifier, List<CartItem>>((ref) => CartStateNotifier());