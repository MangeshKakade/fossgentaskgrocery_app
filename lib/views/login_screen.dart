import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LightGreen,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cartIcon.png',height: 100,width: 100,),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  color: AppColors.White,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 70,),
                    Row(
                      children: [
                        Text(
                          'Nice To meet you,',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text(
                          'Please enter your phone number to \ncontinue,',
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.Gray,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    buildButton(() {
                      Get.toNamed('/phone-number-login');
                    }, Icons.phone_android, 'Connect with Phone Number', AppColors.Orange,fontFamily: 'Poppins',),
                    SizedBox(height: 30),
                    buildButton(controller.loginWithFacebook, Icons.facebook, 'Connect with Facebook', AppColors.Blue,fontFamily: 'Poppins',),
                    SizedBox(height: 30),
                    buildButton(controller.loginWithEmail, Icons.email, 'Connect with Email', AppColors.BlueAccent,fontFamily: 'Poppins',),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(void Function()? onPressed, IconData icon, String label, Color color, {required String fontFamily}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ), backgroundColor: color,
        minimumSize: Size(double.infinity, 50),
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10), // Adjust the spacing between the icon and text
          Expanded(
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
