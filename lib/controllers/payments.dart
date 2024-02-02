import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentsController extends GetxController {
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds

    //call the success api
    print(response);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print(response);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print(response);
  }

  Future<void> openCheckout() async {
    final _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    var options = {
      'key': 'rzp_test_8njdwHmjb6vvIy',
      'amount': 50000, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'order_id': 'order_NVOrmPTGNvZVHO', // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60, // in seconds
      'prefill': {'contact': '9000090000', 'email': 'gaurav.kumar@example.com'}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Exception: $e");
    }

    _razorpay.clear();
  }
}
