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
  final List<Vendor> vendors;
  const DataLoaded(this.vendors);
}

class DataError extends DataState{
  final String message;
  const DataError(this.message);
}