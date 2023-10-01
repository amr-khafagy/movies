import 'package:get/get.dart';
import 'package:movies/core/constant/routes.dart';
class LoginController extends GetxController {
  goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

}
