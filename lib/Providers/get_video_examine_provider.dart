import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getVideoExamineProvider = StateNotifierProvider.autoDispose.family<
    GetVideoExamineNotifier,
    APIResponseState<List<QuestionData>>,
    String>((ref, videoId) {
  return GetVideoExamineNotifier(ref, videoId);
});

class GetVideoExamineNotifier
    extends StateNotifier<APIResponseState<List<QuestionData>>> {
  AutoDisposeStateNotifierProviderRef<GetVideoExamineNotifier,
      APIResponseState<List<QuestionData>>> ref;
  final String videoId;
  GetVideoExamineNotifier(this.ref, this.videoId) : super(APIResponseState());

  void getExamine({required String chapterId}) async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(QuestionData.listFromJson).performGet(
        url: "$baseUrl/getVideoExamine",
        params: {"chapterId": chapterId, "videoId": videoId});

    state = response;

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }

  void resetState() {
    state = APIResponseState();
  }
}
