import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/chosen_product_state/product_state.dart';
import 'package:uuid/uuid.dart';

class CartStateNotifier extends StateNotifier<List<CartItem>>{
  CartStateNotifier() : super([]);


  addCartItem(CartItem cartItem){
    //Trying to check if the product is already added and if it is added to the qunatity
    if(state.contains(cartItem)){
      print("cart contains is running");
    }
    state.forEach((item){
      print("cart for each is running");
      if(cartItem.productIsChosen.product == item.productIsChosen.product){
        print("item is already added");
      }
    });
    //Here by using firstWhereOrNull function we can return null if there is value found
    CartItem? existedItem = state.firstWhereOrNull((CartItem item){
      print("cart state is running");
      if(cartItem.productIsChosen.product == item.productIsChosen.product){
        print("item is already added");
      }
      return cartItem.productIsChosen.product == item.productIsChosen.product;
    },);
    //Here we check for condition and update code after
    if(null == existedItem){
      //ToDo: Add conditional code
      print("cart item is not found");
    }
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