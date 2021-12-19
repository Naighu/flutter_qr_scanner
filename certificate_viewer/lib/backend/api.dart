import 'dart:convert';

import 'package:certificate_viewer/models/user.dart';
import 'package:http/http.dart' as http;

class Api {
  static const url = "http://159.89.161.168:5000";

  static Future<String> getCertificate(int id) async {
    final urLink = Uri.parse(url + "/getcertificate");
    final response = await http.post(urLink, body: {'id': id.toString()});

    String a = response.body;
    print(a);
    return a;
  }

  static Future<List<User>> getAllUsers() async {
    final urLink = Uri.parse(url + "/getAllUsers");
    final response =
        await http.post(urLink, headers: {"Access-Control_Allow_Origin": "*"});

    List json = jsonDecode(response.body);
    List<User> users = [];
    for (var j in json) {
      users.add(User.fromJson(j));
    }
    return users;
  }
}
