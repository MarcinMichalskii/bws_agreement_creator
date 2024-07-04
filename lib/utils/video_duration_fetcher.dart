import 'dart:async';
import 'dart:html' as html;

class VideoDurationFetcher {
  String videoUrl;

  VideoDurationFetcher(this.videoUrl);

  Future<double> fetchVideoDuration() async {
    Completer<double> completer = Completer<double>();

    html.VideoElement videoElement = html.VideoElement()
      ..src = videoUrl
      ..style.display = 'none'; // Hide the video element

    html.document.body?.append(videoElement);

    videoElement.onLoadedMetadata.listen((event) {
      completer.complete(videoElement.duration.toDouble());
      videoElement.remove(); // Clean up: remove the video element from the DOM
    });

    return completer.future;
  }
}
