import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/constants/colors.dart';
import '../controllers/phone_number_login_controller.dart';

class PhoneNumberLoginScreen extends GetView<PhoneNumberLoginController> {
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profileImage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please enter your phone number to continue or sign in with Face ID',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.Gray,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneNumberController,
              onChanged: (phoneNumber) {
                controller.phoneNumber(phoneNumber);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your phone number',
                prefixIcon: Icon(Icons.phone_android,color: AppColors.Green,),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.Green), // Set the border color to green
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.loginWithPhoneNumber,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: AppColors.Green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Next',style: TextStyle(fontFamily: 'Poppins',),),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {

              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                side: BorderSide(color: AppColors.Green),
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.white,
              ),
              child: Text(
                'Sign in With Face ID',
                style: TextStyle(color: AppColors.Green,fontFamily: 'Poppins',),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {

                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.Gray,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
