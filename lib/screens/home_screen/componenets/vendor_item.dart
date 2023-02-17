import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../models/vendor_model.dart';

class VendorItem extends StatelessWidget {
  const VendorItem({
    Key? key, required this.vendor,
  }) : super(key: key);

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShopScreen(vendor: vendor)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        height: 120.h,
        width: 160.w,
        color: Color(0xfff5f5f5),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Image.network(vendor.vendorShopLogo, errorBuilder: (context, error, stackTrace){
                return Image.asset("assets/images/place_holders/logo_placeholder.png");
              },),
            ),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vendor.vendorShopName,
                    style: TextStyle(
                      fontFamily: "Avenir-Book",
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Visit Shop",
                        style: TextStyle(
                          fontFamily: "Avenir",
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 20.h,
                        width: 20.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: FittedBox(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
