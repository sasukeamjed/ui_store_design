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
  @override
  void initState() {
    // if(widget.attributes.length != 0){
    //   if(widget.attributes[0].options is Map<String, dynamic>){
    //     print("Maaaaaaaaaaaaaaaaaaaaaaaaaaaaap <String, dynamic>");
    //   }else if(widget.attributes[0].options is List<String>){
    //     print("Liiiiiiiiiiiiiiiiiiiiiiiiiiiist <String>");
    //   }else{
    //     print("This condiiiiiiiiiiiiiiiiiiiiiiiiiiition did not work");
    //   }
    //
    // }
    // print("variations_section.dart ${}");

    super.initState();
  }

  List<Expanded> dropDownButtonsGenerator() {
    List<String> attributes;

    attributes = widget.variations.keys.toList();

    return attributes.map((attribute) {
      String? value = widget.variations[attribute]![0];
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: DropdownButton(
            isExpanded: true,
            hint: Text(attribute),
              items: widget.variations[attribute]?.map((option) => DropdownMenuItem<String>(
                        child: Text(option), value: value,)).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  value = newValue;
                });
              }),
        ),
      );
    }).toList();
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
