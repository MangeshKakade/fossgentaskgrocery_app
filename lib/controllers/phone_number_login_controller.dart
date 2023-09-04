import 'package:get/get.dart';

class PhoneNumberLoginController extends GetxController {
  final RxString phoneNumber = RxString('');

  void loginWithPhoneNumber() {

    Get.toNamed('/location');
  }
}
