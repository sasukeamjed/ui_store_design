import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/build_btn.dart';

class EmptyAddress extends StatefulWidget {


  @override
  State<EmptyAddress> createState() => _EmptyAddressState();
}

class _EmptyAddressState extends State<EmptyAddress> {
  Map<String, List<String>> addresses = {
    "Muscat" : ["muscat", "matrah", "al aamrat", "al seeb"],
    "Al Dakheliya" : ["nizwa", "izki", "samayel"],
    "Al Batinah" : ["Barka", "al musanhah", "liwa"],
  };

  String? _region;
  String? _state;

  DropdownMenuItem<String> _buildDropDownMenuItem(String item){
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: DottedBorder(
          color: Colors.black.withOpacity(0.3),
          strokeWidth: 3,
          dashPattern: [12, 6],
          child: Container(
            height: 60.h,
            width: 310.w,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Add a new address",
                    style: TextStyle(
                      fontFamily: "Avenir-Book",
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.black.withOpacity(0.4),
                    size: 24.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: (){
        showModalBottomSheet(context: context, builder: (context){
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Your New Address", style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),),
                    SizedBox(
                      height: 20.h,
                    ),
                    DropdownButton<String>(
                      value: _region,
                      isExpanded: true,
                      hint: Text("Region"),
                      focusColor: Colors.white,
                      items: <String>[
                        ...addresses.keys
                      ].map<DropdownMenuItem<String>>(_buildDropDownMenuItem).toList(),
                      onChanged: (String? newValue){
                        setModalState(() {
                          _state = null;
                          _region = newValue;
                        });
                      },
                    ),
                    DropdownButton<String>(
                      value: _state,
                      isExpanded: true,
                      hint: Text("State"),
                      focusColor: Colors.white,
                      items: <String>[
                        ...addresses[_region] ?? [],
                      ].map<DropdownMenuItem<String>>(_buildDropDownMenuItem).toList(),
                      onChanged: (String? newValue){
                        setModalState(() {
                          _state = newValue;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Street Address",
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 44.h,
                      child: TextButton(
                        child: Text(
                          "Add Your New Address",
                          style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 15.sp),
                        ),
                        onPressed: (){},
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
      },
    );
  }
}
