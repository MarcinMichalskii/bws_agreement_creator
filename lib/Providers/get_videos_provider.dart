import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/add_video_provider.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/delete_video_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getVideosProvider = StateNotifierProvider.family<GetVideosNotifier,
    APIResponseState<List<VideoData>>, String>((ref, chapterId) {
  return GetVideosNotifier(ref, chapterId);
});

class GetVideosNotifier
    extends StateNotifier<APIResponseState<List<VideoData>>> {
  StateNotifierProviderRef<GetVideosNotifier, APIResponseState<List<VideoData>>>
      ref;
  final String chapterId;

  GetVideosNotifier(this.ref, this.chapterId) : super(APIResponseState()) {
    ref.listen(addVideoProvider, (previous, next) {
      final chapterId = next.params?['chapterId'];
      if (next.data != null && chapterId == this.chapterId) {
        getVideos(chapterId);
      }
    });
    ref.listen(deleteVideoProvider, (previous, next) {
      if (next.data != null && next.params!['chapterId'] == chapterId) {
        getVideos(next.params!['chapterId']!);
      }
    });
  }

  void getVideos(String chapterId) async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(VideoData.listFromJson).performGet(
        url: "$baseUrl/getVideos", params: {"chapterId": chapterId});
    state = response;
  }
}
