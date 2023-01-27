import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/my_orders_screen.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/shipping_address_screen/shipping_address_screen.dart';

class ProfileComponents extends StatelessWidget {
  const ProfileComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("My Orders", style: TextStyle(fontSize: 14.sp),),
          subtitle: Text("already have 12 orders", style: TextStyle(fontSize: 12.sp)),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){
            Navigator.of(context).pushNamed(MyOrders.routeName);
          },
          dense: true,
        ),
        Divider(
          height: 1,
        ),
        ListTile(
          title: Text("Shipping Addresses", style: TextStyle(fontSize: 14.sp),),
          subtitle: Text("3 addresses", style: TextStyle(fontSize: 12.sp)),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){
            Navigator.of(context).pushNamed(ShippingAddressScreen.routeName);
          },
          dense: true,
        ),
        Divider(
          height: 1,
        ),
        ListTile(
          title: Text("Payment Methods", style: TextStyle(fontSize: 14.sp),),
          subtitle: Text("Visa **34", style: TextStyle(fontSize: 12.sp)),
          trailing: Icon(Icons.arrow_forward_ios),
          dense: true,
        ),
        Divider(
          height: 1,
        ),
        ListTile(
          title: Text("Settings", style: TextStyle(fontSize: 14.sp),),
          subtitle: Text("notifications, passwords", style: TextStyle(fontSize: 12.sp)),
          trailing: Icon(Icons.arrow_forward_ios),
          dense: true,
        ),

      ],
    );
  }
}
