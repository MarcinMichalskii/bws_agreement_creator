import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateVideoUserDataProvider = StateNotifierProvider.family<
    UpdateVideoUserDataNotifier,
    APIResponseState<String?>,
    String>((ref, videoId) {
  return UpdateVideoUserDataNotifier(ref, videoId);
});

class UpdateVideoUserDataNotifier
    extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<UpdateVideoUserDataNotifier,
      APIResponseState<String?>> ref;
  final String videoId;

  UpdateVideoUserDataNotifier(this.ref, this.videoId)
      : super(APIResponseState());

  void updateVideoUserData(
      {required int secondsWatched, required int finishedWatchingAt}) async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(NoDataResponseParser.parse)
        .performPut(url: "$baseUrl/updateVideoUserData", params: {
      "videoId": videoId,
      "secondsWatched": secondsWatched,
      "finishedWatchingAt": finishedWatchingAt
    });
    state = response;
  }
}
