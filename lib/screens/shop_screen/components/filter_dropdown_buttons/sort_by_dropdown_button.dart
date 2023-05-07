import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/choose_filter_state_provider.dart';
import 'package:ui_store_design/providers/filter_provider.dart';
import 'package:ui_store_design/services/filtering_system/filter.dart';

class SortByDropDownButton extends StatefulWidget {
  const SortByDropDownButton(
      {Key? key, required this.hintText, required this.values})
      : super(key: key);

  final String hintText;
  final List<dynamic> values;

  @override
  State<SortByDropDownButton> createState() => _SortByDropDownButtonState();
}

class _SortByDropDownButtonState extends State<SortByDropDownButton> {

  SortByFilter _dropdownValue = SortByFilter.popular;

  @override
  void initState() {
    // dropdownValue = list.first;
    super.initState();
  }

  String _enumToStringFilterName(SortByFilter enumName){
    if(enumName == SortByFilter.priceHighToLow){
      return "price high to low";
    }else if(enumName == SortByFilter.priceLowToHigh){
      return "price low to high";
    }else{
      return enumName.name.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          return DropdownButton2<SortByFilter>(

            dropdownWidth: MediaQuery.of(context).size.width,
            hint: Center(
              child: Text(
                widget.hintText,
                style: TextStyle(
                    fontFamily: "Avenir-Book",
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            value: _dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            style: const TextStyle(color: Colors.deepPurple),
            isExpanded: true,
            underline: SizedBox(),
            onChanged: (SortByFilter? value) async {

              setState(() {
                _dropdownValue = value!;
              });
              ref.read(shopScreenLoadingDataState.notifier).state = true;
              final dio = ref.read(dioProvider);
              List<Product>? products = await _mainFilter(dio);
              ref.read(productsProvider.notifier).state = _sortByFilter(products!, value!);
              ref.read(shopScreenLoadingDataState.notifier).state = false;
            },
            items: SortByFilter.values.map<DropdownMenuItem<SortByFilter>>((SortByFilter value) {
              return DropdownMenuItem<SortByFilter>(
                value: value,
                child: Center(
                  child: Text(
                    _enumToStringFilterName(value),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList(),
          );
        }
    );
  }

  List<Product> _sortByFilter(List<Product> sortProducts, SortByFilter sortTypeFilter) {


    switch (sortTypeFilter) {
      case SortByFilter.popular:
        {

          return sortProducts;
        }

      case SortByFilter.sales:
        {

          return sortProducts.sorted((product1, product2) {
            return product2.totalSales.compareTo(product1.totalSales);
          });

        }

      case SortByFilter.newest:
        {
          return sortProducts
              .sorted((product1, product2) {
            return product1.dateCreated.compareTo(product2.dateCreated);
          });

        }

      case SortByFilter.priceLowToHigh:
        {
          return sortProducts.sorted((product1, product2) {
            return double.parse(product1.price).compareTo(double.parse(product2.price));
          });

        }

      case SortByFilter.priceHighToLow:
        {
          return sortProducts.sorted((product1, product2) {
            return double.parse(product2.price).compareTo(double.parse(product1.price));
          });

        }
      default:
        return sortProducts;
    }
  }


  Future<List<Product>?> _mainFilter(Dio dio) async {

    try {
      List<Product> filteredProducts;
      Response response = await dio.get(Uri.parse("wp-json/wc/v3/products").toString(), queryParameters: {
        "per_page": "100",
        "orderby": "popularity",
        "order": "desc"
      });

      List<dynamic> productsResponse = response.data;

      List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

      filteredProducts = products.where((product) => product.price != 0.00 && product.status == "publish").toList();
      return filteredProducts;
    } catch (e) {
      print(e);
    }



  }
}