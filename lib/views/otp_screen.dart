import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../constants/colors.dart';
import '../controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  final OTPController viewModel = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<OTPController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter OTP Code',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,fontFamily: 'Poppins',),
                ),
                SizedBox(height: 10),
                Text(
                  'A verification code has been sent to',
                  style: TextStyle(fontSize: 14, color: AppColors.Gray,fontFamily: 'Poppins',),
                ),
                Text(
                  '+1234567890', // Replace with the actual number
                  style: TextStyle(fontSize: 14, color: AppColors.Orange,fontFamily: 'Poppins',),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildOtpField(context, viewModel),
                    SizedBox(width: 10,),
                    buildOtpField(context, viewModel),
                    SizedBox(width: 10,),
                    buildOtpField(context, viewModel),
                    SizedBox(width: 10,),
                    buildOtpField(context, viewModel),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: AppColors.Green,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't receive the code?",
                        style: TextStyle(color: AppColors.Gray,fontFamily: 'Poppins',),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/signup');
                        },
                        child: Text(
                          'Resend',
                          style: TextStyle(color: AppColors.Orange,fontFamily: 'Poppins',),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildOtpField(BuildContext context, OTPController viewModel) {
    return Container(
      width: 65,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.Green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: PinCodeTextField(
        appContext: context,
        length: 1,
        keyboardType: TextInputType.number,
        textStyle: TextStyle(fontSize: 20, color: AppColors.Dark,fontFamily: 'Poppins',),
        cursorColor: AppColors.Green,
        onChanged: viewModel.onOtpChanged,
        onCompleted: (value) {

        },
      ),
    );
  }
}
