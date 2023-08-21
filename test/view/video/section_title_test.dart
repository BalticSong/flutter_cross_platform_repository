import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/presentation/view/section_title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SectionTitle widget test with button visible', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SectionTitle(title: 'Test Title', buttonVisible: true),
        ),
      ),
    );

    // Find the Text widget with the title
    final titleFinder = find.text('Test Title');
    expect(titleFinder, findsOneWidget);

    // Find the OutlinedButton widget
    final buttonFinder = find.byType(OutlinedButton);
    expect(buttonFinder, findsOneWidget);

    // Tap the button
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Verify that the button tap action is working
    // Insert your verification logic here based on the action triggered by the button
  });

  testWidgets('SectionTitle widget test with button not visible', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SectionTitle(title: 'Test Title', buttonVisible: false),
        ),
      ),
    );

    // Find the Text widget with the title
    final titleFinder = find.text('Test Title');
    expect(titleFinder, findsOneWidget);

    // Find the OutlinedButton widget
    final buttonFinder = find.byType(OutlinedButton);
    expect(buttonFinder, findsNothing);
  });
}
