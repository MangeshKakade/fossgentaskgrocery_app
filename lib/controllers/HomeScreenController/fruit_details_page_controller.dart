import 'package:get/get.dart';
import 'package:grocery_app/models/product_model.dart';

class FruitDetailController extends GetxController {
  final Rx<Fruits> _selectedFruit = Rx<Fruits>(Fruits());

  Fruits get selectedFruit => _selectedFruit.value;

  set selectedFruit(Fruits fruit) {
    _selectedFruit.value = fruit;
  }
}
