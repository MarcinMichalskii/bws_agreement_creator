import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoPassedData {
  bool passed;
  VideoPassedData({required this.passed});

  factory VideoPassedData.fromJson(Map<String, dynamic> json) {
    return VideoPassedData(passed: json["videoPassed"]);
  }
}

final updateVideoUserDataProvider = StateNotifierProvider.autoDispose.family<
    UpdateVideoUserDataNotifier,
    APIResponseState<VideoPassedData>,
    String>((ref, videoId) {
  return UpdateVideoUserDataNotifier(ref, videoId);
});

class UpdateVideoUserDataNotifier
    extends StateNotifier<APIResponseState<VideoPassedData>> {
  AutoDisposeStateNotifierProviderRef<UpdateVideoUserDataNotifier,
      APIResponseState<VideoPassedData>> ref;
  final String videoId;

  UpdateVideoUserDataNotifier(this.ref, this.videoId)
      : super(APIResponseState());

  void updateVideoUserData(
      {required int secondsWatched,
      required int finishedWatchingAt,
      required String chapterId}) async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(VideoPassedData.fromJson)
        .performPut(url: "$baseUrl/updateVideoUserData", params: {
      "videoId": videoId,
      "secondsWatched": secondsWatched,
      "finishedWatchingAt": finishedWatchingAt
    });

    if (response.data?.passed == true) {
      ref.read(getVideosProvider(chapterId).notifier).getVideos();
    }
    state = response;
  }
}
