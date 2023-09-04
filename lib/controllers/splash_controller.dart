import 'package:get/get.dart';

class SplashController extends GetxController {
  void init() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed('/slider');
    });
  }
}
