import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getChapterExamineProvider = StateNotifierProvider.autoDispose.family<
    GetChapterExamineNotifier,
    APIResponseState<List<QuestionData>>,
    String>((ref, chapterId) {
  return GetChapterExamineNotifier(ref, chapterId);
});

class GetChapterExamineNotifier
    extends StateNotifier<APIResponseState<List<QuestionData>>> {
  AutoDisposeStateNotifierProviderRef<GetChapterExamineNotifier,
      APIResponseState<List<QuestionData>>> ref;
  final String chapterId;
  GetChapterExamineNotifier(this.ref, this.chapterId)
      : super(APIResponseState());

  void getExamine() async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(QuestionData.listFromJson).performGet(
        url: "$baseUrl/getChapterExamine", params: {"chapterId": chapterId});
    state = response;

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }

  void resetState() {
    state = APIResponseState();
  }
}
