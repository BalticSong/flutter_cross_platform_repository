import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/data/remote/model/song_model.dart';
import 'package:flutter_cross_platform_poc/presentation/view/horizontal_songs_list.dart';
import 'package:flutter_cross_platform_poc/presentation/view/section_title.dart';
import 'package:flutter_cross_platform_poc/presentation/view/vertical_songs_list.dart';
import 'package:flutter_cross_platform_poc/utils/app_localizations.dart';

class VideosView extends StatelessWidget {
  final continuePlayingList = [
    SongModel('Relaxing', 'Study Time'),
    SongModel('Smooth', 'Rainy Day'),
    SongModel('Weekend', 'Skateboarding'),
  ];

  final watchedList = [
    SongModel('Your Favourites', 'Artists to Watch'),
    SongModel('Best Hits', 'Office Playlist'),
    SongModel('Your Favourites', 'Artists to Watch'),
  ];

  final popularList = [
    SongModel('California Lifestyle', 'Tommy'),
    SongModel('Top Charts', 'Alma'),
    SongModel('Together Forever', 'Janas & Janas'),
  ];

  VideosView();

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context);
    appLocalization?.load();
    return FutureBuilder<Locale>(
        // Load the stored locale when the app starts
        future: appLocalization?.loadLocale(),
        builder: (context, snapshot) {
          return Scaffold(
            body: ListView(
              children: [
                SectionTitle(
                  title: appLocalization?.translate('continue_playing') ??
                      'Continue Playing',
                  buttonVisible: true,
                ),
                HorizontalSongsList(songList: continuePlayingList, width: 150),
                SectionTitle(
                  title: appLocalization?.translate('for_you') ?? 'For you',
                  buttonVisible: true,
                ),
                HorizontalSongsList(songList: watchedList, width: 180),
                SectionTitle(
                  title: appLocalization?.translate('popular_videos') ??
                      'Popular Videos',
                  buttonVisible: false,
                ),
                VerticalSongsList(songList: popularList),
              ],
            ),
          );
        });
  }
}
