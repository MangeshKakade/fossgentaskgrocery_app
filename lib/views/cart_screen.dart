import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/views/payment_screen.dart';
import '../constants/colors.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            decoration: BoxDecoration(

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.Dark, width: 1),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/fruit_details');
                    },
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: AppColors.Dark,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add functionality to navigate to the cart screen
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
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'My Order',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartController.cartItems[index];
                final itemCount = cartController.getItemCount(cartItem.item);

                return ListTile(
                  title: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.LightGreen,
                        ),
                        child: Image.network(
                          cartItem.item.image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '$itemCount X',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.Dark,
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Column(
                                  children: [
                                    Text(
                                      '${cartItem.item.name ?? ''}',                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.Dark,
                                    ),
                                    ),
                                    SizedBox(height: 2,),
                                    Text(
                                      '\$${(cartItem.item.price!)}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.RED,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 12,),
                                Text(
                                  'Total :-\$${(cartItem.item.price! * itemCount).toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.Dark,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                color: AppColors.Gray,

                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete_forever_outlined,
                                    color: AppColors.Dark,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    cartController.removeFromCart(cartItem);
                                    setState(() {});
                                  },
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
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Gray,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '\$${cartController.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Green,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(
                        PaymentScreen(totalAmount: cartController.totalPrice),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.Green,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Payment',
                      style: TextStyle(fontSize: 20,fontFamily: 'Poppins',),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
