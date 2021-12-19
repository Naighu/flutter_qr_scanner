import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scanner/backend/api.dart';
import 'package:scanner/models/food.dart';
import 'package:scanner/models/user.dart';

class RegistrationController extends GetxController {
  String name = "";
  String sem = "";
  String department = "";
  String college = "";
  String mobile = "";

  submit() {
    Api.addUser(
        name: name,
        sem: sem,
        mobile: mobile,
        department: department,
        college: college);
  }
}
