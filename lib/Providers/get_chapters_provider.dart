import 'package:bws_agreement_creator/Model/chapter_data.dart';
import 'package:bws_agreement_creator/Providers/add_chapter_provider.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/delete_chapter_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Providers/update_chapters_order_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/move_element_list_extension.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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

    ref.listen(updateChaptersOrderProvider, (previous, next) {
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

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }

  void reorderChapters(int oldIndex, int newIndex) {
    final List<ChapterData> videos = state.data!;

    videos.move(oldIndex, newIndex);
    state = APIResponseState(data: videos);
    ref.read(updateChaptersOrderProvider.notifier).updateChaptersOrder(
        chaptersOrderList: videos.map((e) => e.id).toList());
  }

  ChapterData? getChapterForId(String id) {
    return state.data?.firstWhereOrNull((element) => element.id == id);
  }

  bool isChapterLocked(String videoId) {
    final firstIndexUnpassed =
        state.data?.indexWhere((element) => element.passed == false);
    final videoIndex =
        state.data?.indexWhere((element) => element.id == videoId);

    if (videoIndex == 0) {
      return false;
    }

    if (firstIndexUnpassed == -1 || firstIndexUnpassed == null) {
      return false;
    }

    if (firstIndexUnpassed >= videoIndex!) {
      return false;
    }

    return true;
  }
}
