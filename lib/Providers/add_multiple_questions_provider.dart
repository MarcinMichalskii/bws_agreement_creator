import 'package:bws_agreement_creator/Model/add_chapter_question_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addMultipleQuestionsProvider = StateNotifierProvider<
    AddMultipleQuestionsNotifier, APIResponseState<String?>>((ref) {
  return AddMultipleQuestionsNotifier(ref);
});

class AddMultipleQuestionsNotifier
    extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<AddMultipleQuestionsNotifier,
      APIResponseState<String?>> ref;
  AddMultipleQuestionsNotifier(this.ref) : super(APIResponseState());

  void addQuestions({
    required List<AddChapterQuestionData> questions,
    required String chapterId,
  }) async {
    state = APIResponseState(isLoading: true);

    final params = questions.map((e) => e.toJson()).toList();

    state =
        await ApiController(NoDataResponseParser.parse).performPost(params: {
      'chapterId': chapterId,
      'questions': params,
    }, url: "$baseUrl/addMultipleQuestionsForChapter");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}
