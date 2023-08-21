import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cross_platform_poc/data/remote/model/song_model.dart';
import 'package:flutter_cross_platform_poc/presentation/view/horizontal_songs_list.dart';

void main() {
  testWidgets('HorizontalSongsList displays song titles and subtitles',
          (WidgetTester tester) async {
        final songList = [
          SongModel('Song 1', 'Subtitle 1'),
          SongModel('Song 2', 'Subtitle 2'),
          SongModel('Song 3', 'Subtitle 3'),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: HorizontalSongsList(songList: songList, width: 150),
            ),
          ),
        );

        // Verify that the correct number of song cards are displayed
        expect(find.byType(InkWell), findsNWidgets(songList.length));

        // Verify that song titles and subtitles are displayed correctly
        for (var song in songList) {
          expect(find.text(song.title), findsOneWidget);
          expect(find.text(song.subTitle), findsOneWidget);
        }
      });


}
