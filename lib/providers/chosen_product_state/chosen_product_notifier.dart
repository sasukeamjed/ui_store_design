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
      state = ProductIsChosen(product: this._product, price: this._product.price ?? "0.0", thumbnailImage: this._product.images[0].src);
      return;
    }
  }

  //this method will get the crossbonding variation from the options which were
  //chosed by the user dropdown buttons
  ProductVariationModel? getTheCrossBondingVariation(Map<String, dynamic> choosenOptions){

    if(_product.productVariations.isEmpty){
      // print("getTheCrossBondingVariation function, 1st condition => true");
      state = ProductIsChosen(product: this._product, price: this._product.price ?? "0.0", thumbnailImage: this._product.images[0].getThumbnailImage());
      return null;
    }
    List<ProductVariationModel> variations = this._product.productVariations;

    ProductVariationModel? variation;
    try{
      variation = variations.firstWhere((variation){

        Map<String, dynamic> orginalProductAttributesMap = variation.attributes.map((key, value) {
          if (key.contains("pa_")) {
            return MapEntry(key.replaceAll("pa_", "").toLowerCase(), value.toLowerCase());
          } else if (key.contains("attribute_pa_")) {
            return MapEntry(key.replaceAll("attribute_pa_", "").toLowerCase(), value.toLowerCase());
          }else if(key.contains("attribute_")){
            return MapEntry(key.replaceAll("attribute_", "").toLowerCase(), value.toLowerCase());
          }
          else {
            return MapEntry(key.toLowerCase(), value.toLowerCase());
          }
        });

        Map<String, dynamic> choosenOptionsMapToSmallLetters = choosenOptions.map((key, value) {

          return MapEntry(key.toLowerCase(), value.toLowerCase());

        });

        return mapEquals(orginalProductAttributesMap, choosenOptionsMapToSmallLetters);

      });

      if(variation == null){
        state = MissingVariationState();
      }else{
        state = ProductIsChosen(product: _product.productIsChosen(variation), price: variation.variationPrice, thumbnailImage: variation.image.getThumbnailImage() ?? "");
      }      return variation;
    }catch(e){
      state = MissingVariationState();
    }

    // print("The product state is => $state");
  }
}

final productIsChosenNotifier = StateNotifierProvider.autoDispose.family<ChosenProductNotifier, ProductState, Product>((ref, product){
  return ChosenProductNotifier(product);
});