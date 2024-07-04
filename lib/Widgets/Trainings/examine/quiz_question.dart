import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
part 'quiz_question.g.dart';

@CopyWith()
class QuizQuestion {
  final QuestionData question;
  final String? markedAnswer;

  QuizQuestion({required this.question, this.markedAnswer});
}
