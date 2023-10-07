import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/view/component/auth/otptextfield.dart';
import 'package:movies/view/screen/auth/login.dart';
import 'package:movies/view/screen/auth/register.dart';
import 'package:movies/view/screen/home/homescreen.dart';
import 'package:movies/view/screen/otp.dart';
import 'package:movies/view/screen/seriesdetails/seriesdetails.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page: () => const Login()),
  GetPage(name: AppRoutes.register, page: () => const Register()),
  GetPage(name: AppRoutes.verification, page: () => const Verification()),
  GetPage(name: AppRoutes.seriesDetails, page: () => SeriesDetails()),
  GetPage(name: AppRoutes.home, page:()=>const HomeScreen()),
  GetPage(name: AppRoutes.otp, page:()=>const Verification())

];
