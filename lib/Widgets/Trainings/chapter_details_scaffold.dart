import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/videos_list_widget.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterDetailsScaffold extends HookConsumerWidget {
  final String chapterId;
  final String chapterName;

  const ChapterDetailsScaffold(
      {super.key, required this.chapterId, required this.chapterName});

  @override
  Widget build(BuildContext context, ref) {
    final videosProvider = getVideosProvider(chapterId);
    final videos = ref.watch(videosProvider).data ?? [];
    final onExamineOpen = useCallback(() {
      context.pushScreen('examine', params: {
        'id1': chapterId,
      }, queryParams: {
        'name': chapterName
      });
    }, []);
    final canStartExamine = videos
                .where((element) {
                  return element.passed;
                })
                .toList()
                .length ==
            videos.length &&
        videos.isNotEmpty;
    useBuildEffect(() {
      ref.read(videosProvider.notifier).getVideos();
    }, []);

    final onVideoOpen = useCallback((VideoData video) {
      context.pushScreen('watchVideo', params: {
        'id1': chapterId,
        'id2': video.id
      }, queryParams: {
        'title': video.name,
        'url': video.url,
      });
    }, []);

    final chapterPassed = ref
            .watch(getChaptersProvider)
            .data
            ?.where((element) => element.id == chapterId)
            .first
            .passed ==
        true;

    return AppScaffold(
      title: "Lista filmów dla rozdziału $chapterName",
      body: Column(
        children: [
          VideosListWidget(
            onVideoOpen: onVideoOpen,
            videos: videos,
            hasSubtitle: false,
          ),
          canStartExamine
              ? StartExamineWidget(
                  chapterPassed: chapterPassed,
                  onExamineOpen: onExamineOpen,
                )
              : Container()
        ],
      ),
    );
  }
}

class StartExamineWidget extends HookConsumerWidget {
  final bool chapterPassed;
  VoidCallback onExamineOpen;

  StartExamineWidget(
      {super.key, required this.onExamineOpen, required this.chapterPassed});
  @override
  Widget build(BuildContext context, ref) {
    return TouchableOpacity(
      onTap: () {
        onExamineOpen();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.quiz_outlined,
              color: chapterPassed
                  ? CustomColors.green
                  : CustomColors.applicationColorMain,
              size: 24),
          Container(
            margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
            child: Text(
              chapterPassed ? 'Sprawdź się ponownie' : 'Rozpocznij test',
              style: const TextStyle(fontSize: 24, color: CustomColors.gray),
            ),
          )
        ],
      ),
    );
  }
}
