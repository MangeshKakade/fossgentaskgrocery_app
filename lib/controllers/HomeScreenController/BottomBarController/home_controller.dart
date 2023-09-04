import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../../../services/api_service.dart';
import '../fruit_details_page_controller.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService();
  RxList<Fruits> fruits = <Fruits>[].obs;
  RxInt selectedTabIndex = 0.obs;
  final FruitDetailController fruitDetailController = Get.put(FruitDetailController());
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadFruitsData();
  }

  Future<void> _loadFruitsData() async {
    try {
      isLoading.value = true;
      List<Fruits> data = await apiService.fetchFruits();
      fruits.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  void onTabPressed(int index) {
    selectedTabIndex.value = index;
  }

  void onFruitCardTap(Fruits fruit) {
    fruitDetailController.selectedFruit = fruit;
    Get.toNamed('/fruit_details');
  }
}
