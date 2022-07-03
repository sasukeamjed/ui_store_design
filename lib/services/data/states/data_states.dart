import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/models/user_model.dart';

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
  const DataLoaded(this.products);
}

class DataError extends DataState{
  final String message;
  const DataError(this.message);
}