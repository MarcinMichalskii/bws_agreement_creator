import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class ChapterQuestionData {
  String id;
  String questionText;
  List<String> answers;
  String chapterId;
  String correctAnswer;
  bool passed;

  ChapterQuestionData({
    required this.id,
    required this.questionText,
    required this.answers,
    required this.chapterId,
    required this.correctAnswer,
    required this.passed,
  });

  factory ChapterQuestionData.fromJson(Map<String, dynamic> json) {
    return ChapterQuestionData(
      id: json['id'],
      questionText: json['questionText'],
      answers: List<String>.from(json['answers']),
      chapterId: json['chapterId'],
      correctAnswer: json['correctAnswer'],
      passed: json['passed'],
    );
  }

  static List<ChapterQuestionData> listFromJson(Map<String, dynamic> json) {
    List<ChapterQuestionData> chapters = [];
    for (var chapter in json['data']) {
      chapters.add(ChapterQuestionData.fromJson(chapter));
    }
    return chapters;
  }
}
