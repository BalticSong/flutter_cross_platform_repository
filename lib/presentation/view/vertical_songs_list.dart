import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/data/remote/model/song_model.dart';
import 'package:flutter_cross_platform_poc/utils/app_theme.dart';

class VerticalSongsList extends StatelessWidget {
  final List<SongModel> songList;

  VerticalSongsList({required this.songList});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    var safeHeight = height - padding.top - padding.bottom;
    return Container(
      height: safeHeight,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: songList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0),
            child: Container(
              height: 80,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ), //
                  // Image
                  Image.asset(
                    'assets/images/album.png',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(width: 10),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songList[index].title,
                        style: AppTheme.HEADER_TITLE_STYLE,
                      ),
                      Text(
                        songList[index].title,
                        style: AppTheme.SUB_HEADER_TITLE_STYLE,
                      ),
                    ],
                  ),
                  Spacer(), // Adds space between the text and the icon
                  // Icon
                  Icon(
                    Icons.arrow_right,
                    size: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
