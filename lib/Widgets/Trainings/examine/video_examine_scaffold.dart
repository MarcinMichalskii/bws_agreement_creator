import 'package:bws_agreement_creator/Providers/check_video_examine_provider.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/get_video_examine_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/components/examine_ui.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/examine_provider.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/video_examine_finished_widget.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoExamineScaffold extends HookConsumerWidget {
  final String chapterId;
  final String videoTitle;
  final String videoId;
  final bool openedFromVideosList;
  const VideoExamineScaffold({
    super.key,
    required this.chapterId,
    required this.videoTitle,
    required this.videoId,
    required this.openedFromVideosList,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isLoading = useState(true);
    final questionsList = ref.watch(getVideoExamineProvider(videoId)).data;

    final examQuestions = ref.watch(examineProvider)?.questions ?? [];

    final videoQuizPassed = ref
            .read(getVideosProvider(chapterId))
            .data
            ?.where((element) => element.id == videoId)
            .first
            .examinePassed ==
        true;

    useBuildEffect(() {
      if (questionsList == null) {
        return;
      }
      ref.read(examineProvider.notifier).prepareExam(questionsList);
      isLoading.value = false;
      return null;
    }, [questionsList]);

    useBuildEffect(() {
      ref
          .read(getVideoExamineProvider(videoId).notifier)
          .getExamine(chapterId: chapterId);
      return null;
    }, []);

    final onCheckExamResult = useCallback(() {
      ref.read(checkVideoExamineProivder(videoId).notifier).checkExamine(
            questions: examQuestions,
            chapterId: chapterId,
          );
    }, [examQuestions, chapterId, videoId]);

    final examResult = ref.watch(checkVideoExamineProivder(videoId)).data;

    final openNextVideo = useCallback(() {
      final nextVideo =
          ref.read(getVideosProvider(chapterId).notifier).getNextVideo(videoId);

      context.pushScreen('watchVideo', params: {
        'id1': chapterId,
        'id2': nextVideo!.id
      }, queryParams: {
        'title': nextVideo.name,
        'url': nextVideo.url,
      });
    }, [chapterId, videoId]);

    final openCurrentVideo = useCallback(() {
      final video = ref
          .read(getVideosProvider(chapterId).notifier)
          .getVideoForId(videoId);

      context.pushScreen('watchVideo', params: {
        'id1': chapterId,
        'id2': videoId
      }, queryParams: {
        'title': video!.name,
        'url': video.url,
      });
    }, []);

    final goToVideosList = useCallback(() {
      final chapterName = ref
          .read(getChaptersProvider.notifier)
          .getChapterForId(chapterId)
          ?.name;
      context.pushScreen('videosList',
          params: {'id1': chapterId}, queryParams: {'name': chapterName});
    }, [chapterId, videoTitle]);

    final onExitExam = useCallback(() {
      if (examResult == null) {
        return;
      }

      final lastVideo =
          ref.read(getVideosProvider(chapterId).notifier).isLastVideo(videoId);

      if (!openedFromVideosList && lastVideo && !examResult.passed) {
        openCurrentVideo();
        return;
      }

      if (openedFromVideosList || lastVideo) {
        goToVideosList();
        return;
      }

      if (examResult.passed && !lastVideo) {
        openNextVideo();
        return;
      }

      if (!examResult.passed) {
        openCurrentVideo();
      }

      context.pop();
    }, [examResult, openNextVideo]);

    return AppScaffold(
        title: "Egzamin do filmu $videoTitle",
        body: examResult != null
            ? VideoExamineFinishedWidget(
                isLastVideo: ref
                    .read(getVideosProvider(chapterId).notifier)
                    .isLastVideo(videoId),
                passingAgain: videoQuizPassed,
                onFinish: onExitExam,
                result: examResult,
                numberOfQuestions: examQuestions.length)
            : ExamineUI(
                onExamFinished: onCheckExamResult,
                isLoading: isLoading.value,
              ));
  }
}
