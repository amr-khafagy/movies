import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    //TODO=>What is Either?
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print("Status Requst${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print("ResponseBody$responsebody");
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }
}
