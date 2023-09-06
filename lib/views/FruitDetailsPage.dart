import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controllers/HomeScreenController/fruit_details_page_controller.dart';
import '../controllers/cart_controller.dart';

class FruitDetailsPage extends StatefulWidget {
  @override
  State<FruitDetailsPage> createState() => _FruitDetailsPageState();
}

class _FruitDetailsPageState extends State<FruitDetailsPage> {
  final FruitDetailController fruitDetailController =
  Get.find<FruitDetailController>();
  final CartController cartController = Get.put(CartController());

  bool isLiked = false;
  bool addedToCart = false;

  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    final selectedFruit = fruitDetailController.selectedFruit;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: AppColors.Orange,
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed('/home');
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: AppColors.White,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.Dark,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Get.toNamed('/cart');
                    },
                    icon: Stack(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: AppColors.Green,
                          size: 45,
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.RED,
                            ),
                            child: Text(
                              cartController.cartItems.length.toString(),
                              style: TextStyle(
                                color: AppColors.White,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Image.network(
                    selectedFruit.image ?? '',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedFruit.name ?? '',
                        style: TextStyle(fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.Orange),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                            child: Icon(
                              isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isLiked
                                  ? AppColors.RED
                                  : AppColors.Gray,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Sweet and Juicy',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.Orange,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    selectedFruit.description ?? '',
                    style: TextStyle(fontSize: 15, color: AppColors.Gray),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: AppColors.Gray,
                          child: Icon(
                            Icons.access_time,
                            color: AppColors.Dark,
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Time',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '15 - 20 min',
                            style: TextStyle(fontSize: 14,fontFamily: 'Poppins',),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' \$${selectedFruit.price}',
                        style: TextStyle(fontSize: 30,fontFamily: 'Poppins',),
                      ),
                      Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.Green),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (itemCount > 1) {
                                    itemCount--;
                                  }
                                });
                              },
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: AppColors.Green,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              '$itemCount',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.Green),
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  itemCount++;
                                });
                              },
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.Green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cartController.addToCart(selectedFruit,itemCount);
                        Get.toNamed('/cart');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 15, color: AppColors.White,fontFamily: 'Poppins',),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
