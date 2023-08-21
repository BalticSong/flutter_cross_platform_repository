// api_service.dart
import 'dart:convert';
import 'package:flutter_cross_platform_poc/data/remote/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://dummyjson.com';
  Future<UserModel> loginUser(String username, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/auth/login'),
        body: jsonEncode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }

  }

}
