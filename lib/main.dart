import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/HomeScreenController/fruit_details_page_controller.dart';
import 'controllers/cart_controller.dart';
import 'controllers/location_controller.dart';
import 'controllers/login_controller.dart';
import 'controllers/phone_number_login_controller.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: routes,
      initialBinding: BindingsBuilder(() {
        Get.put(FruitDetailController());
        Get.put(LoginController()); // Initialize LoginController
        Get.put(PhoneNumberLoginController());
        Get.put(LocationController());
        Get.put(CartController());
      }),
    );
  }
}

