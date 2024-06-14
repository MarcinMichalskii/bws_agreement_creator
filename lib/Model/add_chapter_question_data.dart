import 'package:copy_with_extension/copy_with_extension.dart';
part 'add_chapter_question_data.g.dart';

@CopyWith()
class AddChapterQuestionData {
  String questionText;
  List<String> answers;
  String chapterId;
  String correctAnswer;
  List<String> videos;

  AddChapterQuestionData({
    required this.questionText,
    required this.answers,
    required this.chapterId,
    required this.correctAnswer,
    required this.videos,
  });

  Map<String, dynamic> toJson() {
    return {
      'questionText': questionText,
      'answers': answers,
      'chapterId': chapterId,
      'correctAnswer': correctAnswer,
      'videos': videos,
    };
  }
}
