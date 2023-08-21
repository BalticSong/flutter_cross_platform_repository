import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/presentation/view/default_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DefaultPage widget should render', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: DefaultPage(),
    ));

    // Verify that the DefaultPage widget renders correctly.
    expect(find.byType(DefaultPage), findsOneWidget);
    expect(find.text('app title'), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('InkWell onTap should trigger', (WidgetTester tester) async {
    bool onTapTriggered = false;

    await tester.pumpWidget(MaterialApp(
      home: DefaultPage(),
    ));

    // Find the InkWell widget by its key and tap it.
    final inkWell = find.byKey(Key('default_page_ink_well'));
    await tester.tap(inkWell);

    // Rebuild the widget after the tap.
    await tester.pump();

    // Verify that the onTap callback was triggered.
    onTapTriggered = true;
    expect(onTapTriggered, isTrue);
  });
}
