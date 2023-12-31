import 'package:get/get.dart';
import 'package:grocery_app/views/FruitDetailsPage.dart';
import 'package:grocery_app/views/cart_screen.dart';
import 'package:grocery_app/views/slider_page.dart';
import 'views/HomeScreen/home_screen.dart';
import 'views/location_screen.dart';
import 'views/phone_number_login_screen.dart';
import 'views/splash_screen.dart';
import 'views/signup_screen.dart';
import 'views/otp_screen.dart';
import 'views/login_screen.dart';

var routes = [
  GetPage(name: '/', page: () => SplashScreen()),
  GetPage(name: '/signup', page: () => SignupScreen()),
  GetPage(name: '/otp', page: () => OTPScreen()),
  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(name: '/phone-number-login', page: () => PhoneNumberLoginScreen()),
  GetPage(name: '/location', page: () => LocationScreen()), 
  GetPage(name: '/home', page: () => HomeScreen()), 
  GetPage(name: '/fruit_details', page: () => FruitDetailsPage()),
  GetPage(name: '/cart', page: () => CartScreen()), 
  GetPage(name: '/slider', page: () => SliderPage()),

];
