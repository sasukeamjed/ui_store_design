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
  var newIndex = 0;

  @override
  void initState() {
    widget.variations.forEach((key, List<String> values) {
      dropdownValues.add(values);
    });
    super.initState();
  }


  List<Expanded> dropDownButtonsGenerator() {
    //How to make a dynamic dropdowns buttons with values
    //https://stackoverflow.com/questions/61061194/flutter-generating-multiple-dropdown-in-for-loop-based-on-list-length
    List<String> attributes;

    attributes = widget.variations.keys.toList();

    // return attributes.map((attribute) {
    //   String? value = widget.variations[attribute]![0];
      
    return List.generate(dropdownValues.length, (index) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: DropdownButton<String>(
            value: dropdownValues[index][newIndex],
            isExpanded: true,
            hint: Text(attributes[index].replaceAll("pa_", "")),
            items: List.generate(dropdownValues[index].length, (insideIndex) {
              return DropdownMenuItem<String>(child: Text(dropdownValues[index][insideIndex]), value: dropdownValues[index][insideIndex],);
            }),
            onChanged: (newValue){
              setState(() {
                newIndex = dropdownValues[index].indexOf(newValue!);
              });
            },
          ),
        ),
      );
      });
    //   return Expanded(
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 15.w),
    //       child: DropdownButton(
    //         isExpanded: true,
    //         value: ,
    //         hint: Text(attribute.replaceAll("pa_", "")),
    //           items: widget.variations[attribute]?.map((option) => DropdownMenuItem<String>(
    //                     child: Text(option), value: value,)).toList(),
    //           onChanged: (String? newValue) {
    //             setState(() {
    //               value = newValue;
    //             });
    //           }),
    //     ),
    //   );
    // }).toList();
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
