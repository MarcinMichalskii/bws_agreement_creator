import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class ChapterData {
  String id;
  String name;
  bool passed;

  ChapterData({
    required this.id,
    required this.name,
    required this.passed,
  });

  factory ChapterData.fromJson(Map<String, dynamic> json) {
    return ChapterData(
      id: json['id'],
      name: json['name'],
      passed: json['passed'],
    );
  }

  static List<ChapterData> listFromJson(Map<String, dynamic> json) {
    List<ChapterData> chapters = [];
    for (var chapter in json['data']) {
      chapters.add(ChapterData.fromJson(chapter));
    }
    return chapters;
  }
}
