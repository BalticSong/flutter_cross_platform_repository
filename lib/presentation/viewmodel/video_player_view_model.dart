import 'package:video_player/video_player.dart';
import 'package:flutter/foundation.dart';

class VideoPlayerViewModel extends ChangeNotifier {
  late VideoPlayerController _videoController;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;

  bool _isMuted = false;

  bool get isMuted => _isMuted;

  double _volume = 1.0;

  double get volume => _volume;

  VideoPlayerViewModel();

  VideoPlayerController get videoController => _videoController;

  bool get isPlaying => _isPlaying;
  Duration get currentPosition => _currentPosition;
  Duration get position => _videoController.value.position;
  Duration get duration => _videoController.value.duration;
  Future<void> initializeVideo(String videoUrl) async {
    _videoController = VideoPlayerController.asset(videoUrl);
    await _videoController.initialize();
    _videoController.addListener(_videoListener);
    notifyListeners();
  }

  void _videoListener() {
    if (_videoController.value.isPlaying != _isPlaying) {
      _isPlaying = _videoController.value.isPlaying;
      notifyListeners();
    }
    _currentPosition = _videoController.value.position;
    notifyListeners();

  }

  void playPause() {
    if (_videoController.value.isPlaying) {
      _videoController.pause();
    } else {
      _videoController.play();
    }
  }

  void seekTo(Duration position) {
    _videoController.seekTo(position);
  }
  void toggleMute() {
    if (_isMuted) {
      _videoController.setVolume(_volume);
    } else {
      _videoController.setVolume(0);
    }
    _isMuted = !_isMuted;
    notifyListeners();
  }

  void setVolume(double value) {
    _volume = value;
    if (!_isMuted) {
      _videoController.setVolume(_volume);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _videoController.removeListener(_videoListener);
    _videoController.dispose();
    super.dispose();
  }
}
