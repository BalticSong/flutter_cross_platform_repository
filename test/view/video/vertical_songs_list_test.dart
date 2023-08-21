import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cross_platform_poc/presentation/view/vertical_songs_list.dart'; // Import your widget here
import 'package:flutter_cross_platform_poc/data/remote/model/song_model.dart';

void main() {
  testWidgets('VerticalSongsList widget test', (WidgetTester tester) async {
    final songList = [
      SongModel('Song 1', 'Sub Title 1'),
      SongModel('Song 2', 'Sub Title 2'),
      // Add more songs with unique titles and subtitles
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VerticalSongsList(songList: songList),
        ),
      ),
    );

    // Simulate MediaQuery setup
    final size = tester.binding.window.physicalSize;
    final padding = EdgeInsets.zero; // Simulate no padding

    final height = size.height;
    final safeHeight = height - padding.top - padding.bottom;

    // Find the ListView.builder
    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    // Find and check the existence of the Image widgets
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsNWidgets(songList.length));

    // Find and check the existence of the Icon widgets
    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsNWidgets(songList.length));
  });
}
