// login_usecase.dart
import 'package:flutter_cross_platform_poc/data/remote/model/user_model.dart';
import 'package:flutter_cross_platform_poc/data/repositories/user_repository.dart';



class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase(this.userRepository);

  Future<UserModel> loginUser(String email, String password) async {
    return userRepository.loginUser(email, password);
  }
}
