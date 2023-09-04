import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/constants/colors.dart';
import '../../../controllers/HomeScreenController/BottomBarController/home_controller.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = Get.put(HomeController());
  bool seasonalDataAvailable = true;
  bool promotionDataAvailable = true;
  Map<int, bool> _likedStatus = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
        child: Obx(
              () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profileImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Linda,',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'What would you like to buy ?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search your favorite fruits',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Fruits',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.Green,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle the "View All" button press here
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.orange,
                    ),
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      homeController.onTabPressed(0); // Set the selected tab to "Best Seller"
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: homeController.selectedTabIndex.value == 0 ? Colors.green : Colors.grey,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text(
                      'Best Seller',
                      style: TextStyle(fontSize: 16,fontFamily: 'Poppins',),

                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      homeController.onTabPressed(1); // Set the selected tab to "Seasonal"
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: homeController.selectedTabIndex.value == 1 ? Colors.green : Colors.grey,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text(
                      'Seasonal',
                      style: TextStyle(fontSize: 16,fontFamily: 'Poppins',),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      homeController.onTabPressed(2); // Set the selected tab to "Promotion"
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: homeController.selectedTabIndex.value == 2 ? Colors.green : Colors.grey,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text(
                      'Promotion',
                      style: TextStyle(fontSize: 16,fontFamily: 'Poppins',),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              homeController.isLoading.value
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Expanded(
                child: homeController.selectedTabIndex.value == 0
                    ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.fruits.length,
                  itemBuilder: (BuildContext context, int index) {
                    final fruit = homeController.fruits[index];
                    final isLiked = _likedStatus[index] ?? false;
                    return GestureDetector(
                      onTap: () {
                        homeController.onFruitCardTap(fruit); // Handle card click here
                      },
                      child: Padding(
                        padding: const EdgeInsets.only( left: 20),
                        child: Stack(
                          children: [
                            Card(

                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 210,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(fruit.image ?? ''),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        fruit.name ?? '',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 0,bottom: 20,top: 0),
                                          child: Text(
                                            'Price: \$${fruit.price ?? 0}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 50),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 0,bottom: 20,top: 0),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.add,
                                              color: AppColors.Green,
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              right: 15,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // Toggle liked status
                                    _likedStatus[index] = !isLiked;
                                  });
                                  // Handle like icon click here
                                },
                                child: Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isLiked
                                      ? AppColors.Orange
                                      : AppColors.Gray,
                                  size: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
                    : homeController.selectedTabIndex.value == 1
                    ? seasonalDataAvailable
                    ? ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return null;

                    // Display the list of seasonal fruits
                  },
                )
                    : Text(
                  'Seasonal data is not available.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.Dark, // Change the text color
                  ),
                )
                    : promotionDataAvailable
                    ? ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return null;
                  },
                )
                    : Text(
                  'Promotion data is not available.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.Dark, // Change the text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
