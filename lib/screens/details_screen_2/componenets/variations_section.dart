import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/attributes_model.dart';

List<Color> colors = [
  Color(0xFFDDB692),
  Color(0xFF007AFF),
  Color(0xFFFF9500),
  Color(0xFFFF2D55),
  Color(0xFF5856D6),
  Color(0xFFE5E5EA)
];

class VariationsSection extends StatefulWidget {
  const VariationsSection({
    Key? key,
    required this.attributes,
  }) : super(key: key);

  final List<AttributesModel> attributes;

  @override
  State<VariationsSection> createState() => _VariationsSectionState();
}

class _VariationsSectionState extends State<VariationsSection> {

  late String? variation1;
  late String? variation2;
  late String? variation3;

  @override
  void initState() {
    if(widget.attributes.length != 0){
      variation1 = widget.attributes[0].options[0];
      variation2 = widget.attributes.length > 1 ? widget.attributes[1].options[0] : "";
      variation2 = widget.attributes.length > 2 ? widget.attributes[2].options[0] : "";
    }
    variation1 = "";
    variation2 = "";
    variation3 = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("this is the length of attributes list => ${widget.attributes.length}");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Colors",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(widget.attributes.length > 0)
                DropdownButton<String>(items: widget.attributes[0].options.map((option) => DropdownMenuItem<String>(child: Text(option), value: option,)).toList(), onChanged: (val){
                  setState(() {
                    variation1 = val;
                  });
                }, value: variation1,),
              if(widget.attributes.length > 1)
                DropdownButton<String>(items: widget.attributes[1].options.map((option) => DropdownMenuItem<String>(child: Text(option), value: option,)).toList(), onChanged: (val){
                  setState(() {
                    variation2 = val;
                  });
                }, value: variation2,),
              if(widget.attributes.length > 2)
                DropdownButton<String>(items: widget.attributes[2].options.map((option) => DropdownMenuItem<String>(child: Text(option), value: option,)).toList(), onChanged: (val){
                  setState(() {
                    variation3 = val;
                  });
                }, value: variation3,)
            ],
          ),
        ],
      ),
    );
  }
}

class ColorCircle extends StatelessWidget {
  const ColorCircle({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.w,
      width: 44.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
