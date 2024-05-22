import 'package:bws_agreement_creator/Model/chapter_data.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/chapters_list.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChaptersListScaffold extends HookConsumerWidget {
  const ChaptersListScaffold({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final chapters = ref.watch(getChaptersProvider).data ?? [];
    useBuildEffect(() {
      ref.read(getChaptersProvider.notifier).getChapters();
    }, []);

    final onChapterOpen = useCallback((ChapterData chapter) {
      context.pushScreen('videosList',
          params: {'id1': chapter.id}, queryParams: {'name': chapter.name});
    }, []);

    return AppScaffold(
      title: "Lista szkoleń",
      body: ChaptersListWidget(
          lockUnpassed: true, chapters: chapters, onChapterOpen: onChapterOpen),
    );
  }
}
