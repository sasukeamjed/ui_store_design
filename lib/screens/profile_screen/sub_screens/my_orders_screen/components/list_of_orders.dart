import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/components/order_card.dart';

class ListOfOrders extends StatelessWidget {
  const ListOfOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index){
        return OrderCard();
      },
    );
  }
}