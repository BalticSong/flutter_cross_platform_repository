import 'package:flutter_cross_platform_poc/data/remote/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    test('fromJson should parse a valid JSON map', () {
      final json = {
        'id': 1,
        'username': 'john_doe',
        'email': 'john@example.com',
        'firstName': 'John',
        'lastName': 'Doe',
        'gender': 'male',
        'image': 'profile.jpg',
        'token': 'your_token_here',
      };

      final userModel = UserModel.fromJson(json);

      expect(userModel.id, 1);
      expect(userModel.username, 'john_doe');
      expect(userModel.email, 'john@example.com');
      expect(userModel.firstName, 'John');
      expect(userModel.lastName, 'Doe');
      expect(userModel.gender, 'male');
      expect(userModel.image, 'profile.jpg');
      expect(userModel.token, 'your_token_here');
    });

    test('toJson should convert UserModel to a valid JSON map', () {
      final userModel = UserModel(
        id: 1,
        username: 'john_doe',
        email: 'john@example.com',
        firstName: 'John',
        lastName: 'Doe',
        gender: 'male',
        image: 'profile.jpg',
        token: 'your_token_here',
      );

      final json = userModel.toJson();

      expect(json['id'], 1);
      expect(json['username'], 'john_doe');
      expect(json['email'], 'john@example.com');
      expect(json['firstName'], 'John');
      expect(json['lastName'], 'Doe');
      expect(json['gender'], 'male');
      expect(json['image'], 'profile.jpg');
      expect(json['token'], 'your_token_here');
    });
  });
}
