import 'package:get/get.dart';

class SplashController extends GetxController {
  void init() {
    Future.delayed(Duration(seconds: 25), () {
      Get.offAllNamed('/slider');
    });
  }
}
