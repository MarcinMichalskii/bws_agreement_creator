import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class VideoData {
  String id;
  String name;
  String url;
  String chapterId;
  bool passed;

  VideoData({
    required this.id,
    required this.name,
    required this.passed,
    required this.url,
    required this.chapterId,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      id: json['id'],
      name: json['name'],
      passed: json['passed'],
      url: json['url'],
      chapterId: json['chapterId'],
    );
  }

  static List<VideoData> listFromJson(Map<String, dynamic> json) {
    List<VideoData> chapters = [];
    for (var chapter in json['data']) {
      chapters.add(VideoData.fromJson(chapter));
    }
    return chapters;
  }
}
