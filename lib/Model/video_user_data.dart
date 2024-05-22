import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class VideoUserData {
  int finishedWatchingAt;
  int secondsWatched;

  VideoUserData({
    required this.finishedWatchingAt,
    required this.secondsWatched,
  });

  factory VideoUserData.fromJson(Map<String, dynamic> json) {
    return VideoUserData(
      finishedWatchingAt: json['finishedAt'],
      secondsWatched: json['secondsWatched'],
    );
  }
}
