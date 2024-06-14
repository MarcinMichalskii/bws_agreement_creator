import 'package:copy_with_extension/copy_with_extension.dart';
part 'chapter_question_data.g.dart';

@CopyWith()
class QuestionData {
  String id;
  String questionText;
  List<String> answers;
  String chapterId;
  String correctAnswer;
  List<String> videos;
  bool passed;

  QuestionData({
    required this.id,
    required this.questionText,
    required this.answers,
    required this.chapterId,
    required this.correctAnswer,
    required this.videos,
    required this.passed,
  });

  factory QuestionData.fromJson(Map<String, dynamic> json) {
    return QuestionData(
      id: json['id'],
      questionText: json['questionText'],
      answers: List<String>.from(json['answers']),
      chapterId: json['chapterId'],
      correctAnswer: json['correctAnswer'],
      videos: json['videos'] == null ? [] : List<String>.from(json['videos']),
      passed: json['passed'],
    );
  }

  static List<QuestionData> listFromJson(Map<String, dynamic> json) {
    List<QuestionData> chapters = [];
    for (var chapter in json['data']) {
      chapters.add(QuestionData.fromJson(chapter));
    }
    return chapters;
  }
}
