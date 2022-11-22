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

  ProductIsChosen({required this.product});
}