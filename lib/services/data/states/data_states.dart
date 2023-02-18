import 'package:ui_store_design/models/category_model.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';

class DataState{
  const DataState();
}

class DataInitial extends DataState{
  const DataInitial();
}

class DataLoading extends DataState{
  const DataLoading();
}

class DataLoaded extends DataState{
  final List<Product> products;
  final List<CategoryModel> categories;

  DataLoaded(this.products, this.categories);

}

class DataError extends DataState{
  final String message;
  const DataError(this.message);
}