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
  final List<Product> vendors;
  const DataLoaded(this.vendors);
}

class DataError extends DataState{
  final String message;
  const DataError(this.message);
}