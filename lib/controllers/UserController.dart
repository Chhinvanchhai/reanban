import 'dart:convert';

import 'package:get/get.dart';
import 'package:reanban/api/api.dart';
import 'package:reanban/models/models.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var statusCode = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  logn(data) async {
    try {
      var res = await Api.post("/api/admin/auth/login", data);
      statusCode.value = res.statusCode;
      print(res.statusCode);
      return jsonDecode(res.body);
    } catch (e) {
      statusCode.value = 500;
      print(e);
    }
  }
}
