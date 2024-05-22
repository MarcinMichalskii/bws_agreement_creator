import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Providers/check_examine_provider.dart';
import 'package:bws_agreement_creator/Providers/get_chapter_questions_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/chapter_examine_finished_widget.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'chapter_examine_scaffold.g.dart';

@CopyWith()
class QuizQuestion {
  final ChapterQuestionData question;
  final String? markedAnswer;

  QuizQuestion({required this.question, this.markedAnswer});
}

class ChapterExamineScaffold extends HookConsumerWidget {
  final String chapterId;
  final String chapterName;
  const ChapterExamineScaffold(
      {super.key, required this.chapterId, required this.chapterName});

  List<QuizQuestion> prepareExam(List<ChapterQuestionData> questions) {
    List<QuizQuestion> filteredOutPassed = questions
        .where((question) => !question.passed)
        .map((e) => QuizQuestion(question: e))
        .toList();
    if (filteredOutPassed.length >= 5) {
      return filteredOutPassed.take(5).toList();
    }
    final passedQuestions =
        questions.where((question) => question.passed).toList()..shuffle();
    final numberOfMissingElements = 5 - filteredOutPassed.length;
    final examQuestions = [
      ...filteredOutPassed,
      ...passedQuestions
          .take(numberOfMissingElements)
          .map((e) => QuizQuestion(question: e))
    ];
    examQuestions.shuffle();

    return examQuestions;
  }

  @override
  Widget build(BuildContext context, ref) {
    final questionsList =
        ref.watch(getChapterQuestionsProvider(chapterId)).data ?? [];

    final selectedQuestions = useState<List<QuizQuestion>>([]);

    useEffect(() {
      selectedQuestions.value = prepareExam(questionsList);
    }, [questionsList]);

    useBuildEffect(() {
      ref
          .read(getChapterQuestionsProvider(chapterId).notifier)
          .getChapterQuestions();
    }, []);

    final selectedQuestionIndex = useState(0);

    bool canGoToPreviousQuestion() {
      return selectedQuestionIndex.value > 0;
    }

    bool answerSelected() {
      return selectedQuestions
              .value[selectedQuestionIndex.value].markedAnswer !=
          null;
    }

    bool finalQuestion() {
      return selectedQuestionIndex.value == selectedQuestions.value.length - 1;
    }

    final updateAnswerForQuestion = useCallback((String answer) {
      final selectedQuestion = selectedQuestions
          .value[selectedQuestionIndex.value]
          .copyWith(markedAnswer: answer);
      List<QuizQuestion> questions = [...selectedQuestions.value];
      questions[selectedQuestionIndex.value] = selectedQuestion;
      selectedQuestions.value = questions;
    }, [selectedQuestions.value, selectedQuestionIndex.value]);

    final onFinishExam = useCallback(() {
      ref
          .read(checkExamineProivder(chapterId).notifier)
          .checkExamine(questions: selectedQuestions.value);
    }, [selectedQuestions.value]);

    final examFinished =
        ref.watch(checkExamineProivder(chapterId)).data?.passed != null;
    return AppScaffold(
        title: "Egzamin dla rozdziału $chapterName",
        body: examFinished
            ? ChapterExamineFinished(
                chapterId: chapterId,
                result: ref.watch(checkExamineProivder(chapterId)).data!,
                numberOfQuestions: selectedQuestions.value.length)
            : selectedQuestions.value.isEmpty
                ? Container()
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColors.almostBlack2,
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                selectedQuestions
                                    .value[selectedQuestionIndex.value]
                                    .question
                                    .questionText,
                                style: const TextStyle(
                                    color: CustomColors.gray, fontSize: 20)),
                            ...selectedQuestions
                                .value[selectedQuestionIndex.value]
                                .question
                                .answers
                                .map((answer) {
                              return Row(
                                children: [
                                  AnswerButton(
                                    answer: answer,
                                    isSelected: selectedQuestions
                                            .value[selectedQuestionIndex.value]
                                            .markedAnswer ==
                                        answer,
                                    onPress: () {
                                      updateAnswerForQuestion(answer);
                                    },
                                  ),
                                  const Spacer()
                                ],
                              );
                            }).toList()
                          ],
                        ),
                      ),
                      if (selectedQuestions.value.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            children: [
                              if (canGoToPreviousQuestion())
                                PillButton(
                                    title: "Poprzednie pytanie",
                                    onPress: () {
                                      selectedQuestionIndex.value--;
                                    }),
                              if (canGoToPreviousQuestion()) const Spacer(),
                              Text(
                                  "Pytanie ${selectedQuestionIndex.value + 1}/${selectedQuestions.value.length}",
                                  style: const TextStyle(
                                      color: CustomColors.gray, fontSize: 20)),
                              const Spacer(),
                              if (!finalQuestion())
                                PillButton(
                                    color: answerSelected()
                                        ? CustomColors.applicationColorMain
                                        : CustomColors.gray,
                                    title: "Następne pytanie",
                                    onPress: () {
                                      selectedQuestionIndex.value++;
                                    }),
                              if (finalQuestion())
                                PillButton(
                                    color: answerSelected()
                                        ? CustomColors.applicationColorMain
                                        : CustomColors.gray,
                                    title: "Zakończ egzamin",
                                    onPress: () {
                                      if (answerSelected()) {
                                        onFinishExam();
                                      }
                                    }),
                            ],
                          ),
                        )
                    ],
                  ));
  }
}

class AnswerButton extends HookConsumerWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onPress;
  const AnswerButton(
      {super.key,
      required this.answer,
      required this.isSelected,
      required this.onPress});

  @override
  Widget build(BuildContext context, ref) {
    return TouchableOpacity(
      onTap: () {
        onPress();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle,
              color: isSelected ? CustomColors.green : CustomColors.gray,
              size: 24),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 24, color: CustomColors.gray),
            ),
          )
        ],
      ),
    );
  }
}
