import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/product_variation_model.dart';
import 'package:ui_store_design/providers/chosen_product_state/product_state.dart';

class ChosenProductNotifier extends StateNotifier<ProductState>{
  final Product _product;

  ChosenProductNotifier(this._product) : super(ProductInitialState()){
    if(_product.productVariations.isEmpty){
      // print("getTheCrossBondingVariation function, 1st condition => true");
      state = ProductIsChosen(product: this._product, price: this._product.price ?? 0.0);
      return;
    }
  }

  //this method will get the crossbonding variation from the option which was
  //choosed by the user dropdowns buttons
  getTheCrossBondingVariation(Map<String, dynamic> choosenOptions){

    if(_product.productVariations.isEmpty){
      // print("getTheCrossBondingVariation function, 1st condition => true");
      state = ProductIsChosen(product: this._product, price: this._product.price ?? 0.0);
      return;
    }
    List<ProductVariationModel> variations = this._product.productVariations;
    ProductVariationModel? variation;
    try{
      variation = variations.firstWhere((variation){

        // print("The Cross Bonding Variation is => ${mapEquals(variation.attributes, choosenOptions)}");
        return mapEquals(variation.attributes, choosenOptions);

      });
    }catch(e){
      state = MissingVariationState();
    }

    if(variation == null){
      state = MissingVariationState();
    }else{
      state = ProductIsChosen(product: _product.productIsChosen(variation), price: double.parse(variation.displayPrice));
    }
    // print("The product state is => $state");
  }
}

final productIsChosenNotifier = StateNotifierProvider.autoDispose.family<ChosenProductNotifier, ProductState, Product>((ref, product){
  return ChosenProductNotifier(product);
});