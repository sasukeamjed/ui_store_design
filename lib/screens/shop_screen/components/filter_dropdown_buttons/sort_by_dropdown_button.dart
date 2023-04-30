import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/choose_filter_state_provider.dart';
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
            value: ref.watch(sortByFilterProvider),
            icon: const Icon(Icons.arrow_downward),
            style: const TextStyle(color: Colors.deepPurple),
            isExpanded: true,
            underline: SizedBox(),
            onChanged: (SortByFilter? value) {
              ref.read(shopScreenLoadingDataState.notifier).state == true;
              ref.read(sortByFilterProvider.notifier).state = value!;
              ref.read(mainFilterProvider.notifier).removeFirstItem();

              // ref.read(mainFilterProvider.notifier).mainFilter();
              ref.read(shopScreenLoadingDataState.notifier).state == false;
              // setState(() {
              //   dropdownValue = value!;
              // });
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