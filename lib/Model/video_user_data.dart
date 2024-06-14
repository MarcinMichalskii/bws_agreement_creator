import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
enum VideoUserDataNavigationState {
  locked,
  nextVideo,
  examine,
  chapterExamine,
}

class VideoUserData {
  int finishedWatchingAt;
  int secondsWatched;
  bool videoWatched;
  bool hasExamine;
  bool examinePassed;

  VideoUserData(
      {required this.finishedWatchingAt,
      required this.secondsWatched,
      required this.videoWatched,
      required this.hasExamine,
      required this.examinePassed});

  factory VideoUserData.fromJson(Map<String, dynamic> json) {
    return VideoUserData(
      finishedWatchingAt: json['finishedAt'],
      secondsWatched: json['secondsWatched'],
      videoWatched: json['watched'],
      hasExamine: json['hasExamine'],
      examinePassed: json['examinePassed'],
    );
  }

  String videoNextButtonTitle({required bool isLastVideo}) {
    if (hasExamine && !examinePassed) {
      return "Quiz";
    }

    if (!isLastVideo) {
      return "Następny";
    }

    return "Egzamin końcowy";
  }

  VideoUserDataNavigationState getNavigationState({required bool isLastVideo}) {
    if (!videoWatched) {
      return VideoUserDataNavigationState.locked;
    } else if (hasExamine && !examinePassed) {
      return VideoUserDataNavigationState.examine;
    } else if (!isLastVideo) {
      return VideoUserDataNavigationState.nextVideo;
    } else {
      return VideoUserDataNavigationState.chapterExamine;
    }
  }
}
