import 'package:get/get.dart';

class OTPController extends GetxController {
  final RxString otp = ''.obs;

  void onOtpChanged(String value) {
    otp.value = value;
  }

  void onOtpCompleted() {

  }
}
