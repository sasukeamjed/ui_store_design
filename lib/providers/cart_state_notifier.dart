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
    //Here we check if the item is found in the cart or not, because
    //if it is already added we don't want to add another item to the list
    //we just want to increase quantity
    if(existedItem == null){
      //ToDo: Add conditional code
      state = [...state, cartItem];
      print("cart item is not found");
    }
    else{
      print("cart item is found");
      print("adding quantity to cart item");
      addQuantity(existedItem.cartItemId);
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

  addQuantity(Uuid cartItemId){
    state = [
      for (final cartItem in state)
      // we're marking only the matching todo as completed
        if (cartItem.cartItemId == cartItemId)
        // Once more, since our state is immutable, we need to make a copy
        // of the todo. We're using our `copyWith` method implemented before
        // to help with that.
          cartItem.copyWithAddExtraQuantity()
        else
        // other todos are not modified
          cartItem,
    ];
  }

  decQuantity(Uuid cartItemId){

    state = [
      for (final cartItem in state)
      // we're marking only the matching todo as completed

        if (cartItem.cartItemId == cartItemId)
        // Once more, since our state is immutable, we need to make a copy
        // of the todo. We're using our `copyWith` method implemented before
        // to help with that.
          if(cartItem.quantity == 1)
            deleteCartItem(cartItemId)
          else
            cartItem.copyWithLessQuantity()
        else
        // other todos are not modified
          cartItem,
    ];
    // int indexOfCartItem = state.indexOf(item);
    // state[indexOfCartItem] = state[indexOfCartItem].copyWithLessQuantity();
    // if(state[indexOfCartItem].quantity == 0){
    //   deleteCartItem(state[indexOfCartItem].cartItemId);
    // }
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