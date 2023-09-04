import 'package:get/get.dart';
import 'package:grocery_app/models/slider_model.dart';

class SliderViewModel extends GetxController {
  var currentIndex = 0.obs;

  List<SliderItemModel> slides = [
    SliderItemModel(
      image: 'assets/images/sliderImage1.png',
      title: 'Find Nearest Store',
      description: 'Find Thousand Products from the nearest store and quickly delivery.',
      buttonText: 'Next',
    ),
    SliderItemModel(
      image: 'assets/images/sliderImage2.png',
      title: 'Safe Food Delivery',
      description: 'Order fruit and experience fast and safe delivery.',
      buttonText: 'Next',
    ),
    SliderItemModel(
      image: 'assets/images/sliderImage3.png',
      title: 'Order Fresh Fruit',
      description: 'Green fruit has less harmful pollution in the production process.',
      buttonText: 'Get Started',
    ),
  ];

  void nextSlide() {
    if (currentIndex.value < slides.length - 1) {
      currentIndex.value++;
    }
  }
}
