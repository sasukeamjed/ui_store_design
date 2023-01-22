import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/user_model.dart';
import 'package:ui_store_design/providers/cart_state_notifier.dart';
import 'package:ui_store_design/services/auth/auth.dart';
import 'package:ui_store_design/services/auth/states/auth_state.dart';
import 'package:ui_store_design/services/payment/create_session.dart';
import 'package:ui_store_design/services/payment/thawani_payment_api.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentButton extends ConsumerWidget {
  const PaymentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Center(
            child: Text("PAYMENT", style: TextStyle(fontSize: 15.sp, color: Colors.white, fontFamily: "Avenir"),),
          ),
        ),
        onTap: () async{
          List<CartItem> cartItems = ref.watch(cartItemNotifier);
          AuthLoaded authLoaded = ref.read(authProvider) as AuthLoaded;
          final paymentSession = PaymentSession(cartItems, authLoaded.userModel.id.toString(), "${authLoaded.userModel.firstName} ${authLoaded.userModel.lastName}");
          PaymentsAPI api = PaymentsAPI();
          Map sessionData = await api.generateSessionRequest(paymentSession.generateSessionData());
          print("generating session is success ? => ${sessionData["success"]}");

          if(sessionData["success"]){
            print("generating session was success");
            String thawaniPublishableKey = "HGvTMLDssJghr9tlN9gr4DVYt0qyBy";
            String session_id = sessionData["data"]["session_id"];

            final Uri uri = Uri(scheme: 'https', host: 'uatcheckout.thawani.om', path: 'pay/$session_id', queryParameters: {'key': thawaniPublishableKey});
            print("structured url => $uri");
            await launchUrl(uri, mode: LaunchMode.inAppWebView);
            // if(await canLaunchUrl(uri)){
            //   print("url was launched with condition");
            //   await launchUrl(uri);
            // }
          }
          //ToDo: next look how to save payment card
        },
      ),
    );
  }
}