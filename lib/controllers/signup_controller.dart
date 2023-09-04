import 'package:get/get.dart';

class SignupController extends GetxController {
  final RxString phoneNumber = ''.obs;

  void setPhoneNumber(String number) {
    phoneNumber.value = number;
  }

  void navigateToOTP() {

      Get.toNamed('/otp');

  }
}
