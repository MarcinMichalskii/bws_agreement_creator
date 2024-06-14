import 'package:bws_agreement_creator/Widgets/Trainings/examine/quiz_question.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
part 'quiz_data.g.dart';

@CopyWith()
class QuizData {
  QuizData({required this.questions, required this.selectedIndex});
  final int selectedIndex;
  final List<QuizQuestion> questions;

  bool get nextQuestionAvailable => selectedIndex < questions.length - 1;
  bool get previousQuestionAvailable => selectedIndex > 0;

  bool get currentQuestionAnswered =>
      questions[selectedIndex].markedAnswer != null;

  bool get isFinalQuestion => selectedIndex == questions.length - 1;

  QuizQuestion get selectedQuestion => questions[selectedIndex];
}
