import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class VideoData {
  String id;
  String name;
  String url;
  String chapterId;
  bool watched;
  bool examinePassed;
  bool hasExamine;
  double duration;
  String thumbnailUrl;
  bool isOutro;

  VideoData(
      {required this.id,
      required this.name,
      required this.watched,
      required this.examinePassed,
      required this.hasExamine,
      required this.url,
      required this.chapterId,
      required this.duration,
      required this.thumbnailUrl,
      required this.isOutro});

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
        id: json['id'],
        name: json['name'],
        url: json['url'],
        chapterId: json['chapterId'],
        watched: json['watched'],
        examinePassed: json['examinePassed'],
        hasExamine: json['hasExamine'],
        duration: json['duration'],
        thumbnailUrl: json['thumbnailUrl'],
        isOutro: json['isOutro']);
  }

  static List<VideoData> listFromJson(Map<String, dynamic> json) {
    List<VideoData> chapters = [];
    for (var chapter in json['data']) {
      chapters.add(VideoData.fromJson(chapter));
    }
    return chapters;
  }
}
