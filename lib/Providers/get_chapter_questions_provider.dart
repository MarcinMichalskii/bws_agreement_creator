import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Providers/add_multiple_questions_provider.dart';
import 'package:bws_agreement_creator/Providers/add_question_provider.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/delete_question_provider.dart';
import 'package:bws_agreement_creator/Providers/update_question_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getChapterQuestionsProvider = StateNotifierProvider.family<
    GetChapterQuestionsNotifier,
    APIResponseState<List<QuestionData>>,
    String>((ref, chapterId) {
  return GetChapterQuestionsNotifier(ref, chapterId);
});

class GetChapterQuestionsNotifier
    extends StateNotifier<APIResponseState<List<QuestionData>>> {
  StateNotifierProviderRef<GetChapterQuestionsNotifier,
      APIResponseState<List<QuestionData>>> ref;
  final String chapterId;
  GetChapterQuestionsNotifier(this.ref, this.chapterId)
      : super(APIResponseState()) {
    ref.listen(addQuestionProvider, (previous, next) {
      final chapterId = next.params?['chapterId'];
      if (next.data != null && chapterId != null) {
        getChapterQuestions();
      }
    });

    ref.listen(addMultipleQuestionsProvider, (previous, next) {
      final chapterId = next.params?['chapterId'];
      if (next.data != null && chapterId != null) {
        getChapterQuestions();
      }
    });

    ref.listen(deleteQuestionProvider, (previous, next) {
      if (next.data != null) {
        getChapterQuestions();
      }
    });

    ref.listen(updateQuestionProvider, (previous, next) {
      if (next.data != null) {
        getChapterQuestions();
      }
    });
  }

  void getChapterQuestions() async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(QuestionData.listFromJson).performGet(
        url: "$baseUrl/getQuestionsForChapter",
        params: {"chapterId": chapterId});
    state = response;
  }

  void resetState() {
    state = APIResponseState();
  }
}
