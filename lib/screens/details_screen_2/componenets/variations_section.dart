import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/extensions.dart';
import 'package:ui_store_design/models/attributes_model.dart';

class VariationsSection extends StatefulWidget {
  const VariationsSection({
    Key? key,
    required this.variations, required this.getCrossBondingVariation,
  }) : super(key: key);

  final Map<String, List<String>> variations;
  final Function getCrossBondingVariation;

  @override
  State<VariationsSection> createState() => _VariationsSectionState();
}

class _VariationsSectionState extends State<VariationsSection> {

  List<List<String>> dropdownValues = [];
  List<dynamic> newIndexes = [];
  int _selectedIndex = 0;
  late FocusNode dropDownFocus;
  late Map<String, dynamic> choosedVariation;


  @override
  void initState() {
    //we have to keep track of the index of the value of every dropdown button
    //we get the index of the value from onChange method in DropDownButton
    choosedVariation = Map.fromIterable(widget.variations.keys.toList(), key:(key)=> key, value: (e) => null);

    newIndexes = List.generate(widget.variations.length, (index) => null);
    widget.variations.forEach((key, List<String> values) {
      //Adding each list in the map to the List<List<String>> dropdownValues
      dropdownValues.add(values);
    });
    dropDownFocus = FocusNode();
    super.initState();
  }

  String _removeAttributePa(String attributeName){
    if(attributeName.contains("pa_")){
      return attributeName.replaceAll("pa_", "");
    }else if(attributeName.contains("attribute_pa_")){
      return attributeName.replaceAll("attribute_pa_", "");
    }else if(attributeName.contains("attribute_")){
      return attributeName.replaceAll("attribute_", "");
    }else{
      return attributeName;
    }
  }


  List<Expanded> dropDownButtonsGenerator() {

    List<String> attributes;

    attributes = widget.variations.keys.toList();

    //the map should look like this {"attribute_slug": value, "another_attribute_slug" : value}
    //here we will generate a new map according to the variations given

      
    return List.generate(dropdownValues.length, (index) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: _selectedIndex == index ? Colors.green : Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton<String>(
              underline: DropdownButtonHideUnderline(child: Container(),),
              value:  newIndexes[index] == null ? null : dropdownValues[index][newIndexes[index]],
              isExpanded: true,
              hint: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(_removeAttributePa(attributes[index])),
              ),
              items: List.generate(dropdownValues[index].length, (insideIndex) {
                return DropdownMenuItem<String>(child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(dropdownValues[index][insideIndex].capitalize()),
                ), value: dropdownValues[index][insideIndex],);
              }),
              onChanged: (newValue){
                // FocusScope.of(context).requestFocus(dropDownFocus);
                setState(() {
                  var newIndex = dropdownValues[index].indexOf(newValue!);
                  newIndexes[index] = newIndex;
                  choosedVariation[attributes[index]] = newValue;
                  widget.getCrossBondingVariation(choosedVariation);
                  print("this is the choosed variation => $choosedVariation");
                });
              },
              onTap: (){
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      );
      });
  }

  @override
  Widget build(BuildContext context) {
    print("this is in product variations => ${widget.variations}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "Choose Your Product:",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...dropDownButtonsGenerator(),
          ],
        ),
      ],
    );
  }
}


