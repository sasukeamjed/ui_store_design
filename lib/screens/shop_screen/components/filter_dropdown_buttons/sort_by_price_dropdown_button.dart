import 'package:collection/collection.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/filter_provider.dart';
import 'package:ui_store_design/services/filtering_system/filter.dart';

class SortByPriceRangeDropDownButton extends ConsumerStatefulWidget  {
  const SortByPriceRangeDropDownButton(
      {Key? key, required this.hintText, required this.values})
      : super(key: key);

  final String hintText;
  final List<dynamic> values;

  @override
  ConsumerState<SortByPriceRangeDropDownButton> createState() => _SortByPriceRangeDropDownButtonState();
}

class _SortByPriceRangeDropDownButtonState extends ConsumerState<SortByPriceRangeDropDownButton> {
  late dynamic dropdownValue = null;

  @override
  void initState() {
    // dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
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
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      // elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      isExpanded: true,
      underline: SizedBox(),
      onChanged: (String? value) async{
        // This is called when the user selects an item.
        ref.read(priceFilterProvider.notifier).update((state) => value!);
        print("this is the updated price filter => ${ref.read(priceFilterProvider)}");
        setState(() {
          dropdownValue = value!;
        });

        ref.read(shopScreenLoadingDataState.notifier).state = true;

        // Navigator.of(consumerContext).pop();


        try{

          await ref.read(mainFilterMethod);
          print("this is after await");

        }catch(e){
          print("here is the color filter error => $e");
        }
      },
      items: dropdownMenuItems(),
      // items: pricesRanges.where((value) => value != '0-...').mapIndexed<DropdownMenuItem<String>>((int index,String value) {
      //   return DropdownMenuItem<String>(
      //     value: value,
      //     child: Center(
      //       child: Text(
      //         value,
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   );
      // }).toList(),
    );
  }

  List<DropdownMenuItem<String>> dropdownMenuItems(){
    List<DropdownMenuItem<String>> listOfItems = [];

    listOfItems = pricesRanges.where((value) => value != '0-...').mapIndexed<DropdownMenuItem<String>>((int index,String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Center(
          child: Text(
            value,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }).toList();


    //This is the reset button in the Price filter drop down button
    DropdownMenuItem<String> restMenuItem = DropdownMenuItem<String>(
      value: "Reset",
      enabled: false,
      child: Container(
        alignment: Alignment.bottomLeft,
        // color: Colors.blue,
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Reset",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () async{
            setState(() {
              dropdownValue = null;
            });
            ref.read(priceFilterProvider.notifier).update((state) => null);
            print("this is the updated price filter => ${ref.read(priceFilterProvider)}");
            Navigator.pop(context);
            ref.read(shopScreenLoadingDataState.notifier).state = true;

            // Navigator.of(consumerContext).pop();


            try{

              await ref.read(mainFilterMethod);
              print("this is after await");

            }catch(e){
              print("here is the color filter error => $e");
            }
          },
        ),
        // decoration: null,
      ),
      onTap: () {

      },
    );

    listOfItems.add(restMenuItem);


    return listOfItems;

  }
}