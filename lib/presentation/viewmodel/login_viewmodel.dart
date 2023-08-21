// login_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/data/remote/api_service.dart';
import 'package:flutter_cross_platform_poc/data/remote/model/user_model.dart';
import 'package:flutter_cross_platform_poc/data/repositories/user_repository.dart';
import 'package:flutter_cross_platform_poc/domain/usecases/login_usercase.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase = LoginUseCase(UserRepository(ApiService()));
  UserModel? _loggedInUser;

  UserModel? get loggedInUser => _loggedInUser;

  Future<void> loginUser(String email, String password) async {
    try {
      _loggedInUser = await _loginUseCase.loginUser(email, password);
      if (_loggedInUser != null) {

        print(_loggedInUser);
      } else {
        // Show error message or perform other actions if login fails
      }

    } catch (error) {
      rethrow;
    }
  }
}
