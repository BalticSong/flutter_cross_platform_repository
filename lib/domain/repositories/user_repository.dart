// repository.dart
import 'package:flutter_cross_platform_poc/data/remote/api_service.dart';
import 'package:flutter_cross_platform_poc/data/remote/model/user_model.dart';


class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<UserModel> loginUser(String email, String password) async {
    return apiService.loginUser(email, password);
  }
}
