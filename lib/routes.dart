import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/core/middleware/middleware.dart';
import 'package:movies/view/screen/auth/login.dart';
import 'package:movies/view/screen/auth/register.dart';
import 'package:movies/view/screen/updatepassword/forgetpassword.dart';
import 'package:movies/view/screen/home/homescreen.dart';
import 'package:movies/view/screen/seriesdetails/seriesdetails.dart';
import 'package:movies/view/screen/watchlist/watchlist.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page: () => const Login(), middlewares: [MiddleWare()]),
  GetPage(name: AppRoutes.register, page: () => const Register()),
  GetPage(name: AppRoutes.seriesDetails, page: () => SeriesDetails()),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.watchList, page: () => const WatchList()),
];
