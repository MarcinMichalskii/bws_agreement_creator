import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/add_video_provider.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/delete_video_provider.dart';
import 'package:bws_agreement_creator/Providers/update_videos_order_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/move_element_list_extension.dart';
import 'package:collection/collection.dart';
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
        getVideos();
      }
    });
    ref.listen(deleteVideoProvider, (previous, next) {
      if (next.data != null && next.params!['chapterId'] == chapterId) {
        getVideos();
      }
    });

    ref.listen(updateVideosOrderProvider(chapterId), (previous, next) {
      if (next.data != null) {
        getVideos();
      }
    });
  }

  void getVideos() async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(VideoData.listFromJson).performGet(
        url: "$baseUrl/getVideos", params: {"chapterId": chapterId});
    state = response;
  }

  void reorderVideos(int oldIndex, int newIndex) {
    final List<VideoData> videos = state.data!;

    videos.move(oldIndex, newIndex);
    state = APIResponseState(data: videos);
    ref.read(updateVideosOrderProvider(chapterId).notifier).updateVideosOrder(
        chaptersOrderList: videos.map((e) => e.id).toList(),
        chapterId: chapterId);
  }

  VideoData? getVideoForId(String videoId) {
    return state.data?.firstWhereOrNull((element) => element.id == videoId);
  }

  bool isLastVideo(String videoId) {
    return state.data!.last.id == videoId;
  }

  VideoData? getNextVideo(String videoId) {
    final index = state.data?.indexWhere((element) => element.id == videoId);
    if (index == null || index == -1 || index == state.data!.length - 1) {
      return null;
    }
    return state.data?[index + 1];
  }

  bool isVideoLocked(String videoId) {
    final firstIndexUnwatched =
        state.data?.indexWhere((element) => element.watched == false);
    final videoIndex =
        state.data?.indexWhere((element) => element.id == videoId);

    if (videoIndex == 0) {
      return false;
    }

    if (firstIndexUnwatched == -1 || firstIndexUnwatched == null) {
      return false;
    }

    if (firstIndexUnwatched >= videoIndex!) {
      return false;
    }

    return true;
  }
}
