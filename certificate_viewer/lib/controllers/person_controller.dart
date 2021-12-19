import 'package:certificate_viewer/backend/api.dart';
import 'package:certificate_viewer/models/user.dart';
import 'package:get/get.dart';

class PersonController extends GetxController {
  late List<User> userList;
  bool loading = true;

  Future<void> getUserList() async {
    userList = await Api.getAllUsers();
    loading = false;
    update();
    print("userList");
  }
}
