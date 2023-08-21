import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/data/remote/model/song_model.dart';
import 'package:flutter_cross_platform_poc/presentation/view/video_player_view.dart';
import 'package:flutter_cross_platform_poc/utils/app_theme.dart';

class HorizontalSongsList extends StatelessWidget {
  final List<SongModel> songList;
  final double width;

  HorizontalSongsList({required this.songList, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: songList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayerView(videoUrl: 'assets/videos/ElephantsDream.mp4') ),
                );

              },
              child: Container(
                decoration: AppTheme.CARD,
                width: width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        songList[index].title,
                        style: AppTheme.HEADER_TITLE_STYLE,
                      ),
                      Text(
                        songList[index].subTitle,
                        style: AppTheme.SUB_HEADER_TITLE_STYLE,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
