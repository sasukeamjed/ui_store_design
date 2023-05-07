import 'package:ui_store_design/models/product_model.dart';

class ShopPageState{
  final List<Product> productsState;
  final bool loadingState;

  ShopPageState copyWith({List<Product>? productsState, bool? loadingState}) {
    return ShopPageState(
      productsState: productsState ?? this.productsState,
      loadingState: loadingState ?? this.loadingState,
    );
  }

  ShopPageState({required this.productsState, required this.loadingState});
}