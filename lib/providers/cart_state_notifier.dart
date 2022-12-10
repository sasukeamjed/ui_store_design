import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/chosen_product_state/product_state.dart';
import 'package:uuid/uuid.dart';

class CartStateNotifier extends StateNotifier<List<CartItem>>{
  CartStateNotifier() : super([]);


  addCartItem(CartItem cartItem){

    //Here by using firstWhereOrNull function we can return null if there is value found
    CartItem? existedItem = state.firstWhereOrNull((CartItem item){
      print("cart state is running");
      if(cartItem.productIsChosen.product == item.productIsChosen.product){
        print("item is already added");
      }
      return cartItem.productIsChosen.product == item.productIsChosen.product;
    },);
    //Here we check for condition and update code after
    if(existedItem == null){
      //ToDo: Add conditional code
      state = [...state, cartItem];
      print("cart item is not found");
    }
    else{
      print("cart item is found");
      print("adding quantity to cart item");
      addQuantity(existedItem);
    }

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

  decQuantity(CartItem item){
    int indexOfCartItem = state.indexOf(item);
    state[indexOfCartItem] = state[indexOfCartItem].copyWithLessQuantity();
    if(state[indexOfCartItem].quantity == 0){
      deleteCartItem(state[indexOfCartItem].cartItemId);
    }
    //ToDo: if quantity equals 0 removes cart item from a list
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

  CartItem copyWithLessQuantity(){
    return CartItem(productIsChosen: productIsChosen, quantity: this.quantity - 1);
  }
}

final cartItemNotifier = StateNotifierProvider<CartStateNotifier, List<CartItem>>((ref) => CartStateNotifier());