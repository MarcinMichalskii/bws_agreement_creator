import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_draft.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addQuestionProvider =
    StateNotifierProvider<AddQuestionNotifier, APIResponseState<String?>>(
        (ref) {
  return AddQuestionNotifier(ref);
});

class AddQuestionNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<AddQuestionNotifier, APIResponseState<String?>> ref;
  AddQuestionNotifier(this.ref) : super(APIResponseState());

  void addQuestion(
      {required String question,
      required List<AnswerDraft> answers,
      required String chapterId}) async {
    state = APIResponseState(isLoading: true);
    final correctAnswer = answers.firstWhereOrNull((element) {
          return element.isCorrect;
        })?.text ??
        '';

    state =
        await ApiController(NoDataResponseParser.parse).performPost(params: {
      'chapterId': chapterId,
      "questionText": question,
      'answers': answers.map((e) => e.text).toList(),
      'correctAnswer': correctAnswer,
    }, url: "$baseUrl/addQuestionForChapter");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}
