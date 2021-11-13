// import 'package:flutter/material.dart';
// import 'package:ui_store_design/size_config.dart';
//
// class CloseButton extends StatelessWidget {
//   const CloseButton({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
//       child: GestureDetector(
//         onTap: (){
//           Navigator.of(context).pop();
//         },
//         child: Icon(
//           Icons.close,
//           color: Colors.black,
//           size: 30,
//         ),
//       ),
//     );
//   }
// }