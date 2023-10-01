import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/view/screen/auth/login.dart';
import 'package:movies/view/screen/auth/register.dart';
import 'package:movies/view/screen/home/home.dart';
import 'package:movies/view/screen/home/homescreen.dart';
import 'package:movies/view/screen/otp.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page: () => const HomeScreen()),
  GetPage(name: AppRoutes.register, page: () => const Register()),
  GetPage(name: AppRoutes.verification, page: () => const Verification())
];
