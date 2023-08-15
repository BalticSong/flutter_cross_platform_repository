import 'package:flutter/material.dart';
import 'package:flutter_android_ios/presentation/viewmodel/video_player_view_model.dart';
import 'package:flutter_android_ios/utils/app_theme.dart';
import 'package:flutter_android_ios/utils/custom_tab_bar.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerView({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VideoPlayerViewModel>(
      create: (_) => VideoPlayerViewModel()..initializeVideo(videoUrl),
      builder: (context, _) {

        return SafeArea(
          child: DefaultTabController(
              length: 4, // Number of tabs
              child:Scaffold(
              appBar: AppBar(
                title: Text('Video Player'),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.SIZEBOX_HEIGHT_xxSMALL),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PlayVideo(),
                      const SizedBox(height: AppTheme.SIZEBOX_HEIGHT_xxSMALL),
                      VolumeSlider(),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: CustomTabBar(),
              )
          ),
        );
      },
    );
  }
}

class PlayVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VideoPlayerViewModel>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: VideoPlayer(viewModel.videoController),
        ),
        SizedBox(height: AppTheme.SIZEBOX_HEIGHT_xSMALL),
        Text(
          'Title',
          style: AppTheme.HEADER_TITLE_STYLE,
        ),
        Text(
          'Sub Title',
          style: AppTheme.SUB_HEADER_TITLE_STYLE,
        ),
        SizedBox(height: AppTheme.SIZEBOX_HEIGHT_xSMALL),
        Slider(
          value: viewModel.currentPosition.inSeconds.toDouble(),
          onChanged: (value) {
            viewModel.videoController.seekTo(Duration(seconds: value.toInt()));
          },
          min: 0,
          max: viewModel.videoController.value.duration.inSeconds.toDouble(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(viewModel.videoController.value.position),
                style: TextStyle(fontSize: 10),
              ),
              Text(
                _formatDuration(viewModel.videoController.value.duration),
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.rotate_left,size: 40,),
              onPressed: () {
                // Play previous video logic
              },
            ),
            IconButton(
              icon: Icon(viewModel.isPlaying ? Icons.pause : Icons.play_arrow,size: 40),
              onPressed: () {
                viewModel.playPause();
              },
            ),
            IconButton(
              icon: Icon(Icons.rotate_right,size: 40),
              onPressed: () {
                // Play next video logic
              },
            ),
          ],
        ),
      ],
    );
  }
  String _formatDuration(Duration duration) {
    // Format the duration to display as hh:mm:ss
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if(twoDigits(duration.inHours)=='00'){
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}

class VolumeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VideoPlayerViewModel>(context);
    final volume = viewModel.volume;

    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.volume_mute,size: 20),
        Expanded(
          child: Slider(
            value: volume,
            onChanged: (value) {
              viewModel.setVolume(value);
            },
          ),
        ),
        Icon(Icons.volume_up,size: 20),

      ],
    );
  }
}
