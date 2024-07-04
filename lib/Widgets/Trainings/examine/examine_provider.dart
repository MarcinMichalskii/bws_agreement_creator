import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/quiz_data.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/quiz_question.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final examineProvider =
    AutoDisposeStateNotifierProvider<ExamineNotifier, QuizData?>((ref) {
  return ExamineNotifier(ref);
});

class ExamineNotifier extends StateNotifier<QuizData?> {
  final AutoDisposeStateNotifierProviderRef<ExamineNotifier, QuizData?> ref;

  ExamineNotifier(this.ref) : super(null);

  void prepareExam(List<QuestionData> questions) {
    List<QuizQuestion> examQuestions = questions.map((e) {
      final answers = e.answers..shuffle();
      final question = e.copyWith(answers: answers);
      return QuizQuestion(question: question);
    }).toList();
    state = QuizData(questions: examQuestions, selectedIndex: 0);
  }

  void nextQuestion() {
    if (state == null) {
      return;
    }
    if (state!.nextQuestionAvailable) {
      state = state!.copyWith(selectedIndex: state!.selectedIndex + 1);
    }
  }

  void previousQuestion() {
    if (state == null) {
      return;
    }
    if (state!.previousQuestionAvailable) {
      state = state!.copyWith(selectedIndex: state!.selectedIndex - 1);
    }
  }

  void updateAnswerForQuestion(String answer) {
    if (state == null) {
      return;
    }
    final selectedQuestion =
        state!.questions[state!.selectedIndex].copyWith(markedAnswer: answer);
    List<QuizQuestion> questions = [...state!.questions];
    questions[state!.selectedIndex] = selectedQuestion;
    state = state!.copyWith(questions: questions);
  }
}
