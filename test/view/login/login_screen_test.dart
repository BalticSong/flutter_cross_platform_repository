import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cross_platform_poc/presentation/view/login_page.dart';

void main() {
  testWidgets('LoginPage UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify that login fields and buttons are displayed.
    expect(find.byKey(Key('textfield_username')), findsOneWidget);
    expect(find.byKey(Key('textfield_password')), findsOneWidget);
    expect(find.byKey(Key('button_login')), findsOneWidget);
    expect(find.byKey(Key('textforgot_password')), findsOneWidget);
    expect(find.byKey(Key('textSign_up')), findsOneWidget);
  });

  testWidgets('Login with valid credentials', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Enter valid credentials and tap the login button.
    await tester.enterText(find.byKey(Key('textfield_username')), 'validUsername');
    await tester.enterText(find.byKey(Key('textfield_password')), 'validPassword');
    await tester.tap(find.byKey(Key('button_login')));

    // Wait for the navigation to complete.
    await tester.pumpAndSettle();

    // Verify that the navigation took the user to the home page.
    // expect(find.byType(HomePage), findsOneWidget);
  });


}
