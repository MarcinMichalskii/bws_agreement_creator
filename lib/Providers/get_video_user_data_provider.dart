import 'package:bws_agreement_creator/Model/video_user_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getVideoUserDataProvider = StateNotifierProvider.family<
    GetVideoUserDataNotifier,
    APIResponseState<VideoUserData>,
    String>((ref, videoId) {
  return GetVideoUserDataNotifier(ref, videoId);
});

class GetVideoUserDataNotifier
    extends StateNotifier<APIResponseState<VideoUserData>> {
  StateNotifierProviderRef<GetVideoUserDataNotifier,
      APIResponseState<VideoUserData>> ref;
  final String videoId;

  GetVideoUserDataNotifier(this.ref, this.videoId) : super(APIResponseState());

  void getVideoUserData() async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(VideoUserData.fromJson).performGet(
        url: "$baseUrl/getVideoUserData", params: {"videoId": videoId});
    state = response;
  }

  void reset() {
    state = APIResponseState();
  }
}
