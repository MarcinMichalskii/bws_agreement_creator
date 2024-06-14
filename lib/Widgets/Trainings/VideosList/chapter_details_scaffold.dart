import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/VideosList/chapter_details_ui.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/exam_access_state.dart';
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
                  if (element.hasExamine) {
                    return element.examinePassed;
                  }
                  return element.watched;
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

    final onVideoExamineOpen = useCallback((VideoData video) {
      context.pushScreen('videoExamine', params: {
        'id1': chapterId,
      }, queryParams: {
        'videoTitle': video.name,
        'videoId': video.id,
        'openedFromList': 'true'
      });
    }, []);

    return AppScaffold(
      title: "Lista filmów dla szkolenia $chapterName",
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChapterDetailsUI(
              videos: videos,
              chapterId: chapterId,
              onVideoOpen: onVideoOpen,
              onExamineOpen: onVideoExamineOpen,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 64),
              child: StartExamineWidget(
                  examAccessState: ExamAccessStateExtension.getExamAccessState(
                      chapterPassed, canStartExamine),
                  onExamineOpen: onExamineOpen),
            )
          ],
        ),
      ),
    );
  }
}

class StartExamineWidget extends HookConsumerWidget {
  final ExamAccessState examAccessState;
  VoidCallback onExamineOpen;

  StartExamineWidget(
      {super.key, required this.examAccessState, required this.onExamineOpen});
  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TouchableOpacity(
        onTap: () {
          if (examAccessState != ExamAccessState.cannotStart) onExamineOpen();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 8, 0, 4),
              child: Text(
                textAlign: TextAlign.center,
                examAccessState.buttonText,
                style: const TextStyle(
                  fontSize: 20,
                  color: CustomColors.gray,
                ),
              ),
            ),
            Icon(Icons.school_outlined,
                color: examAccessState.buttonColor, size: 24),
          ],
        ),
      ),
    );
  }
}
