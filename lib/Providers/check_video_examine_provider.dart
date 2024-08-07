import 'package:bws_agreement_creator/Model/examine_result.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/quiz_question.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final checkVideoExamineProivder = StateNotifierProvider.autoDispose
    .family<CheckExamineNotifier, APIResponseState<ExamineResultData>, String>(
        (ref, videoId) {
  return CheckExamineNotifier(ref, videoId);
});

class CheckExamineNotifier
    extends StateNotifier<APIResponseState<ExamineResultData>> {
  final String videoId;
  AutoDisposeStateNotifierProviderRef<CheckExamineNotifier,
      APIResponseState<ExamineResultData>> ref;
  CheckExamineNotifier(this.ref, this.videoId) : super(APIResponseState());

  void checkExamine(
      {required List<QuizQuestion> questions,
      required String chapterId}) async {
    state = APIResponseState(isLoading: true);

    final answers = questions
        .map((e) => {
              "questionId": e.question.id,
              "answer": e.markedAnswer,
            })
        .toList();
    state =
        await ApiController(ExamineResultData.fromJson).performPost(params: {
      "videoId": videoId,
      "chapterId": chapterId,
      "answers": answers,
    }, url: "$baseUrl/checkVideoExamine");

    if (state.data != null && state.data!.passed) {
      ref.read(getVideosProvider(chapterId).notifier).getVideos();
    }

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }

  void resetState() {
    state = APIResponseState();
  }
}
