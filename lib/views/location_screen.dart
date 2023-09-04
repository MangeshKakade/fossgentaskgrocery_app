import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/location_controller.dart';

import '../constants/colors.dart';

class LocationScreen extends GetView<LocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/locationImage.png',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 40),
              Text(
                'Enable your location',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70),
                child: Text(
                  'To search for the nearest store, we need your location.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.Gray,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  await controller.checkAndRequestLocationPermission();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, color: AppColors.White, size: 24),
                    SizedBox(width: 10),
                    Text('Use Current Location', style: TextStyle(fontSize: 18,fontFamily: 'Poppins',)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  controller.skipLocationAndNavigateToHome();
                },
                child: Text('Skip for Now', style: TextStyle(fontSize: 18, color: AppColors.Gray,fontFamily: 'Poppins',)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
