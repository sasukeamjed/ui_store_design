import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/filtering_system/filter.dart';

final sortByProvider = StateProvider<SortByFilter>((ref) => SortByFilter.initial);

final sortByPriceProvider = StateProvider<String>((ref) => "0-...");