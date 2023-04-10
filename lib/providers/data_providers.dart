import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/services/data/data.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

final productsDataProvider = StateNotifierProvider<ProductsProvider, DataState>((ref) => ProductsProvider());



