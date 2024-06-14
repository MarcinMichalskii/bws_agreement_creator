import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_draft.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateQuestionProvider =
    StateNotifierProvider<UpdateQuestionNotifier, APIResponseState<String?>>(
        (ref) {
  return UpdateQuestionNotifier(ref);
});

class UpdateQuestionNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<UpdateQuestionNotifier, APIResponseState<String?>>
      ref;
  UpdateQuestionNotifier(this.ref) : super(APIResponseState());

  void updateQuestion(
      {required String questionText,
      required String questionId,
      required List<AnswerDraft> answers,
      required List<String> videos,
      required String chapterId}) async {
    state = APIResponseState(isLoading: true);
    final correctAnswer = answers.firstWhereOrNull((element) {
          return element.isCorrect;
        })?.text ??
        '';

    state = await ApiController(NoDataResponseParser.parse).performPut(params: {
      'chapterId': chapterId,
      "questionText": questionText,
      'answers': answers.map((e) => e.text).toList(),
      'videos': videos,
      'correctAnswer': correctAnswer,
      'questionId': questionId
    }, url: "$baseUrl/updateQuestionForChapter");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}
