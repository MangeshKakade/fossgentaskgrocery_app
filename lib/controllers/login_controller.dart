import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;

  void loginWithPhoneNumber() {
    isLoggedIn.value = true;
  }

  void loginWithFacebook() {
    isLoggedIn.value = true;
  }

  void loginWithEmail() {
    isLoggedIn.value = true;
  }


}
