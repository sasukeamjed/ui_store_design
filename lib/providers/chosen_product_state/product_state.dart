import 'package:ui_store_design/models/product_model.dart';

class ProductState{
  const ProductState();
}

class ProductInitialState extends ProductState{

}

class MissingVariationState extends ProductState{

}

class ProductIsChosen extends ProductState{
  final Product product;
  final String price;
  final String thumbnailImage;

  ProductIsChosen({required this.product, required this.price, required this.thumbnailImage});
}