import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/attributes_model.dart';

class VariationsSection extends StatefulWidget {
  const VariationsSection({
    Key? key,
    required this.variations,
  }) : super(key: key);

  final Map<String, List<String>> variations;

  @override
  State<VariationsSection> createState() => _VariationsSectionState();
}

class _VariationsSectionState extends State<VariationsSection> {

  List<List<String>> dropdownValues = [];
  List<int> newIndexes = [];

  @override
  void initState() {
    newIndexes = List.generate(widget.variations.length, (index) => 0);
    widget.variations.forEach((key, List<String> values) {
      dropdownValues.add(values);
    });
    super.initState();
  }


  List<Expanded> dropDownButtonsGenerator() {

    List<String> attributes;

    attributes = widget.variations.keys.toList();

      
    return List.generate(dropdownValues.length, (index) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton<String>(
              focusColor: Colors.green,
              underline: DropdownButtonHideUnderline(child: Container(),),
              value: dropdownValues[index][newIndexes[index]],
              isExpanded: true,
              hint: Text(attributes[index].replaceAll("pa_", "")),
              items: List.generate(dropdownValues[index].length, (insideIndex) {
                return DropdownMenuItem<String>(child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(dropdownValues[index][insideIndex]),
                ), value: dropdownValues[index][insideIndex],);
              }),
              onChanged: (newValue){
                setState(() {
                  var newIndex = dropdownValues[index].indexOf(newValue!);
                  newIndexes[index] = newIndex;
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
