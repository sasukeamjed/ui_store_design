import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  bool checkAddress = false;

  //Body of Checkout Page
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "Checkout",
            style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 8.h),
          child: Text(
            "Shipping to",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Address(),
              EmptyAddress(),

            ],
          ),
        ),
      ],
    );
  }
}

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 70.h,
      width: 310.w,
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            spreadRadius: 0.5,
            blurRadius: 8,
            color: Color(0xFFACB1C0).withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(8.w),
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: SvgPicture.asset(
                "assets/icons/home_icon_address.svg",
                color: Colors.blue,
                fit: BoxFit.fitHeight,
              )),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "658 Yost Island Apt",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 17.sp,
                ),
              ),
              Text(
                "Seattle, US",
                style: TextStyle(
                  fontFamily: "Avenir-Book",
                  fontSize: 15.sp,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: 21.w,
            width: 21.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: SvgPicture.asset('assets/icons/check_shipping_address_mark.svg'),
          ),
        ],
      ),
    );
  }
}

class EmptyAddress extends StatefulWidget {


  @override
  State<EmptyAddress> createState() => _EmptyAddressState();
}

class _EmptyAddressState extends State<EmptyAddress> {
  String? _chosenValue;

  DropdownMenuItem<String> buildDropDownMenuItem(String item){
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(context: context, builder: (context){
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState){
              return Column(
                children: [
                  DropdownButton<String>(
                    value: _chosenValue,
                    isExpanded: true,
                    hint: Text("Region"),
                    focusColor: Colors.white,
                    items: <String>[
                      'Interior',
                      'Dofar',
                      'Al Dahirah'
                    ].map<DropdownMenuItem<String>>(buildDropDownMenuItem).toList(),
                    onChanged: (String? newValue){
                      setModalState(() {
                        _chosenValue = newValue;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: _chosenValue,
                    isExpanded: true,
                    hint: Text("State"),
                    focusColor: Colors.white,
                    items: <String>[
                      'Nizwa',
                      'Adam',
                      'Izki'
                    ].map<DropdownMenuItem<String>>(buildDropDownMenuItem).toList(),
                    onChanged: (String? newValue){
                      setModalState(() {
                        _chosenValue = newValue;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Street Address",
                    ),
                  ),
                ],
              );
            },
          );
        });
      },
      child: DottedBorder(
        color: Color(0xFF0C66FF).withOpacity(0.9),
        strokeWidth: 3,
        dashPattern: [12, 6],
        child: Container(
          height: 70.h,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
