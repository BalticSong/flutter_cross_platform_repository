import 'package:flutter/material.dart';
import 'package:flutter_android_ios/presentation/view/video_player_view.dart';
import 'package:flutter_android_ios/presentation/viewmodel/video_player_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

// Import your classes

class MockVideoPlayerViewModel extends Mock implements VideoPlayerViewModel {}

void main() {
  testWidgets('VideoPlayerView widget test', (WidgetTester tester) async {
    // Create a mock VideoPlayerViewModel
    final mockViewModel = MockVideoPlayerViewModel();

    final mockVideoUrl = 'https://example.com/mock_video.mp4';

    // Use the specific mockVideoUrl for the argument
    when(mockViewModel.initializeVideo(mockVideoUrl))
        .thenAnswer((_) async => Future.value());

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<VideoPlayerViewModel>.value(
          value: mockViewModel,
          child: VideoPlayerView(videoUrl: mockVideoUrl),
        ),
      ),
    );

    // Your testing logic here
  });
}
