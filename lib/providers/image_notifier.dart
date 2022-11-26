//i need this notifier to emits a number of the indexed image
//when the user chose a color from the drop down button
//so when the user chose the color the it gets the variation of the color
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/product_variation_model.dart';

// class ImageNotifier extends StateNotifier<int>{
//
//
//
//   ImageNotifier() : super(0);
//
//   int _currentImageIndex = 0;
//
//   getImageIndexFromVariation(Map<String, dynamic> choosenOptions, Product product){
//
//
//     List<ProductVariationModel> variations = product.productVariations;
//     ProductVariationModel? variation;
//     try{
//       variation = variations.firstWhere((variation){
//
//         // print("The Cross Bonding Variation is => ${mapEquals(variation.attributes, choosenOptions)}");
//         return mapEquals(variation.attributes, choosenOptions);
//
//       });
//
//       String imageVariation = variation.singleImage;
//       _currentImageIndex = product.singleImages.indexOf(imageVariation);
//       state = _currentImageIndex;
//     }catch(e){
//       state = 0;
//     }
//
//
//   }
// }

final imageIndexProvider = Provider<PageController>((ref) => PageController());