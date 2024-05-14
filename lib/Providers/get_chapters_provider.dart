import 'package:bws_agreement_creator/Model/chapter_data.dart';
import 'package:bws_agreement_creator/Providers/add_chapter_provider.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/delete_chapter_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getChaptersProvider = StateNotifierProvider<GetChaptersNotifier,
    APIResponseState<List<ChapterData>>>((ref) {
  return GetChaptersNotifier(ref);
});

class GetChaptersNotifier
    extends StateNotifier<APIResponseState<List<ChapterData>>> {
  StateNotifierProviderRef<GetChaptersNotifier,
      APIResponseState<List<ChapterData>>> ref;
  GetChaptersNotifier(this.ref) : super(APIResponseState()) {
    ref.listen(addChapterProvider, (previous, next) {
      if (next.data != null) {
        getChapters();
      }
    });
    ref.listen(deleteChapterProvider, (previous, next) {
      if (next.data != null) {
        getChapters();
      }
    });
  }

  void getChapters() async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(ChapterData.listFromJson)
        .performGet(url: "$baseUrl/getChapters");
    state = response;
  }
}
