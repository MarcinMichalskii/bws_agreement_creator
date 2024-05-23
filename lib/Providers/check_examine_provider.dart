import 'package:bws_agreement_creator/Model/examine_result.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/quiz_question.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final checkExamineProivder = StateNotifierProvider.family<CheckExamineNotifier,
    APIResponseState<ExamineResultData>, String>((ref, chapterId) {
  return CheckExamineNotifier(ref, chapterId);
});

class CheckExamineNotifier
    extends StateNotifier<APIResponseState<ExamineResultData>> {
  final String chapterId;
  StateNotifierProviderRef<CheckExamineNotifier,
      APIResponseState<ExamineResultData>> ref;
  CheckExamineNotifier(this.ref, this.chapterId) : super(APIResponseState());

  void checkExamine({required List<QuizQuestion> questions}) async {
    state = APIResponseState(isLoading: true);

    final answers = questions
        .map((e) => {
              "questionId": e.question.id,
              "answer": e.markedAnswer,
            })
        .toList();
    state =
        await ApiController(ExamineResultData.fromJson).performPost(params: {
      "chapterId": chapterId,
      "answers": answers,
    }, url: "$baseUrl/checkExamineForAnswer");

    if (state.data != null && state.data!.passed) {
      ref.read(getChaptersProvider.notifier).getChapters();
    }

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }

  void resetState() {
    state = APIResponseState();
  }
}
