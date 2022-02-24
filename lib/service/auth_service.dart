import 'dart:convert';

import '../common/constant.dart';
import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<UserModel> login({
    String? email,
    String? username,
    String? password,
  }) async {
    var url = Uri.parse(Constant.baseUrl + Constant.login);
    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'username': username,
      'password': password,
    });
    var response = await http.post(
      url,
      headers: header,
      body: body,
    );
    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = data['acces_token'];
      return user;
    } else {
      throw Exception('Failed to login');
    }
  }
}
