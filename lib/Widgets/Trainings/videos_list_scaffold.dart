import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/videos_list_widget.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoListScaffold extends HookConsumerWidget {
  final String chapterId;
  final String chapterName;
  const VideoListScaffold(
      {super.key, required this.chapterId, required this.chapterName});

  @override
  Widget build(BuildContext context, ref) {
    final videosProvider = getVideosProvider(chapterId);
    final videos = ref.watch(videosProvider).data ?? [];
    useBuildEffect(() {
      ref.read(videosProvider.notifier).getVideos(chapterId);
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

    return AppScaffold(
      title: "Lista filmów dla rozdziału $chapterName",
      body: VideosListWidget(
        onVideoOpen: onVideoOpen,
        videos: videos,
        hasSubtitle: false,
      ),
    );
  }
}
