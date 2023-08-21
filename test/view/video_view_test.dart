import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/presentation/view/horizontal_songs_list.dart';
import 'package:flutter_cross_platform_poc/presentation/view/vertical_songs_list.dart';
import 'package:flutter_cross_platform_poc/presentation/view/video_view.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('VideosView should render correctly', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: VideosView(),
    ));

    // Verify that key widgets and titles are rendered.
    expect(find.byType(VideosView), findsOneWidget);

    // Verify that section titles are rendered.
    expect(find.text('Continue Playing'), findsOneWidget);
    expect(find.text('For you'), findsOneWidget);
    expect(find.text('Popular Videos'), findsOneWidget);

    // Verify that song lists are rendered.
    expect(find.byType(HorizontalSongsList), findsNWidgets(2));
    expect(find.byType(VerticalSongsList), findsOneWidget);
  });

  testWidgets('VideosView should show section titles correctly', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: VideosView(),
    ));

    // Verify that section titles are rendered with the expected text.
    expect(find.text('Continue Playing'), findsOneWidget);
    expect(find.text('For you'), findsOneWidget);
    expect(find.text('Popular Videos'), findsOneWidget);
  });
}
