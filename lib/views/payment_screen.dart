import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/constants/colors.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final double totalAmount;

  PaymentScreen({required this.totalAmount});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay _razorpay;

  Map<String, bool> paymentMethodSelected = {
    'PayPal': false,
    'Mastercard': false,
    'Visa': false,
    'Dollar': false,
  };

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void openRazorpay(double amount) {
    final options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': (amount * 100).toInt(),
      'name': 'Grocery App',
      'description': 'Payment for Order',
      'prefill': {
        'contact': 'Your Contact Number',
        'email': 'Your Email Address',
      },
      'external': {
        'wallets': ['paytm'],
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error in opening Razorpay: $e");
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment successful: ${response.paymentId}");
    // Handle payment success logic here
    Get.toNamed('/home');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print("Payment failed: ${response.code}, ${response.message}");
    // Handle payment failure logic here
    Get.toNamed('/cart');
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print("External wallet selected: ${response.walletName}");
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void togglePaymentMethod(String method) {
    setState(() {
      paymentMethodSelected.forEach((key, value) {
        paymentMethodSelected[key] = false;
      });
      paymentMethodSelected[method] = true;
      print(paymentMethodSelected);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.Dark),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed('/cart');
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.Dark,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/cart');
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: AppColors.Green,
                      size: 35,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Payment',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Choose the desired service type we offer and suitable for everyday needs',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: AppColors.Gray,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment method',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle "Add new" click
                    },
                    child: Text(
                      'Add New',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.Orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              PaymentMethodTile(
                imageAssetPath: 'assets/payment/paypal.png',
                title: 'PayPal',
                isSelected: paymentMethodSelected['PayPal'] == true,
                onTap: () {
                  togglePaymentMethod('PayPal');
                },
              ),

              SizedBox(height: 10),
              PaymentMethodTile(
                imageAssetPath: 'assets/payment/Mastercard.png',
                title: 'Mastercard',
                isSelected: paymentMethodSelected['Mastercard'] == true,

                onTap: () {
                  togglePaymentMethod('Mastercard');
                },
              ),
              SizedBox(height: 10),
              PaymentMethodTile(
                imageAssetPath: 'assets/payment/visa.png',
                title: 'Visa',
                isSelected: paymentMethodSelected['Visa'] == true,
                onTap: () {
                  togglePaymentMethod('Visa');
                },
              ),
              SizedBox(height: 10),
              PaymentMethodTile(
                imageAssetPath: 'assets/payment/doller.png',
                title: 'Dollar',
                isSelected: paymentMethodSelected['Dollar'] == true,
                onTap: () {
                  togglePaymentMethod('Dollar');
                },
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    openRazorpay(widget.totalAmount);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.Green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String imageAssetPath;
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  PaymentMethodTile({
    required this.imageAssetPath,
    required this.title,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.Gray),
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.Green : Color.fromRGBO(230, 231, 243, 1.0),
        ),
        child: Center(
          child: ListTile(
            leading: Image.asset(
              imageAssetPath,
              width: 80,
              height: 80,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

