import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controllers/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Center the content both horizontally and vertically
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enter Your Phone Number',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,fontFamily: 'Poppins',),
              ),
              SizedBox(height: 10),
              Text(
                'Please enter your phone number to continue.',
                style: TextStyle(fontSize: 18, color: AppColors.Gray,fontFamily: 'Poppins',),
                textAlign: TextAlign.center, // Center the text
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: signupController.setPhoneNumber,
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
                onPressed: signupController.navigateToOTP,
                child: Text('Next',style: TextStyle(fontFamily: 'Poppins',),),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: AppColors.Green,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
