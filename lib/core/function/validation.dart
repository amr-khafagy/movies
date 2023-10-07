import 'package:get/get.dart';

validinput(String value, int min, int max, String type) {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "UserName is not valid";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "Email is not valid";
    }
  }
  if (type == "password") {
    if (!regex.hasMatch(value)) {
      return "password is not valid";
    }
  }
  if (value.isEmpty) {
    return "The field is not valid because is empty";
  }
  if (value.length < min) {
    return "that must be greater than $min";
  }
  if (value.length > max) {
    return "that must be less than $max";
  }
}
