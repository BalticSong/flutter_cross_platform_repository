import 'package:flutter/material.dart';
import 'package:flutter_android_ios/presentation/view/login_page.dart';
import 'package:flutter_android_ios/utils/create_test_app.dart';
import 'package:flutter_test/flutter_test.dart';

class MockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('mock-page'),
      body: SizedBox(
        height: 1.0,
        width: 1.0,
      ),
    );
  }
}

void main() {
  group('Login Page Widget Test', () {
    testWidgets('should be render loading correctly',
            (WidgetTester tester) async {
          var LoginPageRoute = <String, WidgetBuilder>{
            LoginPage.route: (context) => MockPage(),
          };
          await tester.pumpWidget(createTestApp(
            child: LoginPage(),
            routes: LoginPageRoute,
          ));
          await tester.pump();
          final textfieldUsername = find.byKey(Key('textfield_username'));
          final textfieldPassword = find.byKey(Key('textfield_password'));
          final textForgotPassword = find.byKey(Key('textforgot_password'));
          final txtSignup = find.byKey(Key('textSign_up'));
          final buttonLogin = find.byKey(Key('button_login'));

          expect(textfieldUsername, findsOneWidget);
          expect(textfieldPassword, findsOneWidget);
          expect(textForgotPassword, findsOneWidget);
          expect(txtSignup, findsOneWidget);
          expect(buttonLogin, findsOneWidget);
          await tester.tap(buttonLogin);
          await tester.pumpAndSettle();
        });
  });
}
