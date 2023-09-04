import 'package:get/get.dart';
import '../../views/HomeScreen/BottomScreens/cart.dart';
import '../../views/HomeScreen/BottomScreens/home.dart';
import '../../views/HomeScreen/BottomScreens/profile.dart';
import '../../views/HomeScreen/BottomScreens/shopping.dart';

class HomeScreenController extends GetxController {
  var selectedIndex = 0.obs;

  final screens = [
    Home(),
    Shopping(),
    Cart(),
    Profile(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
