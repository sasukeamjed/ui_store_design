import 'package:ui_store_design/models/product_model.dart';

class ShopPageState{
  final List<Product> productsState;
  final bool loadingState;

  ShopPageState({required this.productsState, required this.loadingState});
}