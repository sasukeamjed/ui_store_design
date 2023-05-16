import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/filter_provider.dart';
import 'package:ui_store_design/services/filtering_system/filter.dart';



class SortByDropDownButton extends StatelessWidget {

  const SortByDropDownButton(
      {Key? key, required this.hintText, required this.values})
      : super(key: key);

  final String hintText;
  final List<dynamic> values;


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
                hintText,
                style: TextStyle(
                    fontFamily: "Avenir-Book",
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            value: ref.read(sortByFilterProvider),
            icon: const Icon(Icons.arrow_downward),
            style: const TextStyle(color: Colors.deepPurple),
            isExpanded: true,
            underline: SizedBox(),
            onChanged: (SortByFilter? value) async {

              ref.read(sortByFilterProvider.notifier).state = value!;
              ref.read(shopScreenLoadingDataState.notifier).state = true;

              List<Product>? products = await ref.read(mainFilterMethod);
              ref.read(productsProvider.notifier).state = products!;
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




}