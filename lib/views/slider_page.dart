import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/constants/colors.dart';

import '../controllers/slider_view_model.dart';

class SliderPage extends StatefulWidget {
  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final SliderViewModel controller = Get.put(SliderViewModel());
  final PageController pageController = PageController();
  double currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    ever(controller.currentIndex, (_) {
      pageController.animateToPage(
        controller.currentIndex.value,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget _buildIndicator(int index) {
    return Container(
      width: 30,
      height: 7,
      decoration: BoxDecoration(
        color: controller.currentIndex.value == index ? AppColors.Green : AppColors.Gray,
        shape: controller.currentIndex.value == index ? BoxShape.rectangle : BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.slides.length,
              controller: pageController,
              onPageChanged: (index) {
                controller.currentIndex.value = index;
              },
              itemBuilder: (context, index) {
                final slide = controller.slides[index];
                final double slideOffset = (currentPageValue - index).abs();
                final double scaleFactor = 1 - (slideOffset * 0.3);

                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(currentPageValue - index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        slide.image,
                        height: 350 * scaleFactor,
                      ),
                      SizedBox(height: 20),
                      Text(
                        slide.title,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Text(
                          slide.description,
                          style: TextStyle(fontSize: 16, color: AppColors.Gray, fontFamily: 'Poppins'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                                  () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(controller.slides.length, (index) {
                                  return _buildIndicator(index);
                                }),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: AppColors.Green,
                                minimumSize: Size(100, 50),
                              ),
                              onPressed: () {
                                if (controller.currentIndex.value < controller.slides.length - 1) {
                                  controller.nextSlide();
                                } else {
                                  Get.toNamed('/signup');
                                }
                              },
                              child: Obx(
                                    () => Text(
                                  controller.currentIndex.value < controller.slides.length - 1 ? 'Next' : 'Next',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
