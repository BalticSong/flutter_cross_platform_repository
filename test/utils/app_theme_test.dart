import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/utils/app_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppTheme properties', () {
    expect(AppTheme.TEXTFIELD, isNotNull);
    expect(AppTheme.CARD, isNotNull);
    expect(AppTheme.HEADER_TITLE_STYLE, isNotNull);
    expect(AppTheme.SUB_HEADER_TITLE_STYLE, isNotNull);
    expect(AppTheme.NORMAL_TEXT, isNotNull);
    expect(AppTheme.BOLD_TEXT, isNotNull);
    expect(AppTheme.PAGE_PADDING, isNotNull);
    expect(AppTheme.TEXTFILED_PADDING, isNotNull);
    expect(AppTheme.TEXTFILED_MARGIN, isNotNull);
    expect(AppTheme.SIZEBOX_HEIGHT_xxSMALL, 10.0);
    expect(AppTheme.SIZEBOX_HEIGHT_xSMALL, 20.0);
    expect(AppTheme.SIZEBOX_HEIGHT_SMALL, 30.0);
  });

  testWidgets('Text styles test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              children: [
                Text(
                  'Header Title',
                  style: AppTheme.HEADER_TITLE_STYLE,
                ),
                Text(
                  'Sub Header Title',
                  style: AppTheme.SUB_HEADER_TITLE_STYLE,
                ),
                Text(
                  'Normal Text',
                  style: AppTheme.NORMAL_TEXT,
                ),
                Text(
                  'Bold Text',
                  style: AppTheme.BOLD_TEXT,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text('Header Title'), findsOneWidget);
    expect(find.text('Sub Header Title'), findsOneWidget);
    expect(find.text('Normal Text'), findsOneWidget);
    expect(find.text('Bold Text'), findsOneWidget);
  });

  // Additional test cases...
}
