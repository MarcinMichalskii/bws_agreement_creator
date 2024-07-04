import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
part 'finished_chapter_data.g.dart';

@CopyWith()
@JsonSerializable()
class FinishedChapterData {
  final String chapterId;
  final DateTime date;

  FinishedChapterData({required this.chapterId, required this.date});

  factory FinishedChapterData.fromJson(Map<String, dynamic> json) =>
      _$FinishedChapterDataFromJson(json);
}
