import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controllers/HomeScreenController/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeScreenController());

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_business_outlined),
              label: 'Shopping',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: AppColors.RED, // Selected icon color
          unselectedItemColor: Color.fromRGBO(255, 182, 193, 1.0), // Unselected icon color
          onTap: controller.onItemTapped,
        ),
      ),
    );
  }
}
