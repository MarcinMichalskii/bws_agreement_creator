import 'dart:async';

class VideoDurationFetcher {
  String videoUrl;

  VideoDurationFetcher(this.videoUrl);

  Future<double> fetchVideoDuration() async {
    Completer<double> completer = Completer<double>();

    return completer.future;
  }
}
