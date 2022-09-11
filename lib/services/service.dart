import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/model.dart';

getUser() async {
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));
  var jsonData = jsonDecode(response.body);

  List<UserModel> users = [];
  for (var i in jsonData) {
    UserModel user = UserModel(
        id: i['id'],
        name: i['name'],
        email: i['email'],
        password: i['password'],
        phone: i['phone']);
    users.add(user);
  }
  return users;
}
