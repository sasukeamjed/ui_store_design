import 'package:ui_store_design/providers/cart_state_notifier.dart';
import 'package:uuid/uuid.dart';

class PaymentSession{
  final List<CartItem> _cartItems;
  final String _customerId;
  final String _customerName;

  PaymentSession(cartItems, customerId, customerName) : _cartItems = cartItems, _customerId = customerId, _customerName = customerName;

  generateSessionData(){
    return {
      "client_reference_id" : Uuid().v1().toString(),
      "mode" : "payment",
      "products" : [..._cartItems.map((cartItem) => cartItem.toJson())],
      "success_url": "https://company.com/success",
      "cancel_url": "https://company.com/cancel",
      // "customer_id": this._customerId,
      "metadata": {
        // "Customer name": this._customerName,
        // "order id": 0
      }
    };
  }
}