import 'package:ui_store_design/providers/cart_state_notifier.dart';
import 'package:uuid/uuid.dart';

class PaymentSession{
  final List<CartItem> cartItems;
  final String customerId;
  final String customerName;

  PaymentSession({required this.cartItems, required this.customerId, required this.customerName});

  generateSessionData(){
    return {
      "client_reference_id" : Uuid,
      "mode" : "payment",
      "products" : [...cartItems.map((cartItem) => cartItem.toJson())],
      "success_url": "https://company.com/success",
      "cancel_url": "https://company.com/cancel",
      "customer_id": this.customerId,
      "metadata": {
        "Customer name": this.customerName,
        "order id": 0
      }
    };
  }
}