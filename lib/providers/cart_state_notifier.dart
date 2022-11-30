import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/chosen_product_state/product_state.dart';

class CartStateNotifier extends StateNotifier<List<ProductIsChosen>>{
  CartStateNotifier() : super([]);


  addProduct(ProductIsChosen productIsChosen){
    state.add(productIsChosen);
  }

  deleteProduct(){}

  addQuantity(){}

  calculateTotalPrice(){}
}