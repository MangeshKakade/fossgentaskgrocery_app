import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controllers/HomeScreenController/BottomBarController/profile_controller.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileController controller = Get.put(ProfileController());
  double yOffset = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Obx(() {
              return CircleAvatar(
                backgroundImage: AssetImage(controller.profileImage.value),
                radius: 60,
              );
            }),
            SizedBox(height: 20),
            Obx(() {
              return Text(
                'Hi, ${controller.userName}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            SizedBox(height: 10),
            Obx(() {
              return controller.vip.value
                  ? Container(
                decoration: BoxDecoration(
                  color: AppColors.Green,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: AppColors.White),
                    SizedBox(width: 5),
                    Text(
                      'VIP',
                      style: TextStyle(
                        color: AppColors.White,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              )
                  : SizedBox.shrink();
            }),
            SizedBox(height: 20),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    color: Color.fromRGBO(227, 206, 209, 1.0),
                    padding: EdgeInsets.all(30),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Container(
                              height: 80,
                              width: 80,
                              color: AppColors.RED,
                              child: Icon(
                                  Icons.account_balance_wallet,
                                  color: AppColors.White,
                                size: 45,

                              )
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$${controller.balance.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: AppColors.Dark,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Credit Balance',style: TextStyle(
                              fontSize: 20,
                              color: AppColors.Green,

                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: 30),
            buildOptionRow(Icons.track_changes, 'Tracking Order',fontFamily: 'Poppins',),
            buildOptionRow(Icons.confirmation_number, 'Coupons',fontFamily: 'Poppins',),
            buildOptionRow(Icons.settings, 'Settings',fontFamily: 'Poppins',),
            buildOptionRow(Icons.security, 'Help & Security',fontFamily: 'Poppins',),
            buildOptionRow(Icons.logout, 'Logout',fontFamily: 'Poppins',),

          ],
        ),
      ),
    );
  }

  Widget buildOptionRow(IconData icon, String text, {required String fontFamily}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.Green, // Change this color as needed
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.White,
            ),
          ),
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
