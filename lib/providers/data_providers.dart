import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/services/data/data.dart';

final dataProvider = StateNotifierProvider<VendorsList, List<Vendor>?>((ref) => VendorsList());


