import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  Future<void> checkAndRequestLocationPermission() async {
    var locationStatus = await Permission.location.request();

    if (locationStatus.isGranted) {
      getAndNavigateToHome();
    } else {
    }
  }

  void getAndNavigateToHome() {
         Get.toNamed('/home');
  }

  void skipLocationAndNavigateToHome() {
    Get.toNamed('/home');
  }
}
