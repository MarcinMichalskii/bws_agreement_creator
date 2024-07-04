import 'package:bws_agreement_creator/Model/chapter_data.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_select_videos_ui.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/components/select_dates_range.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/components/user_statistics_header.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/components/user_statistics_switch.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/user_statistics_filter_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserStatisticsFilterWidget extends HookConsumerWidget {
  const UserStatisticsFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final selectedChapters =
        ref.watch(userStatisticsFilterProvider).selectedChapters;
    final onSelectedItemsChanged = useCallback((List<ChapterData> chapters) {
      ref
          .read(userStatisticsFilterProvider.notifier)
          .updateSelectedChapters(chapters);
    }, []);

    final chapters = ref.watch(getChaptersProvider).data ?? [];
    if (chapters.isEmpty) {
      return const Center(
          child: CircularProgressIndicator(
        color: CustomColors.applicationColorMain,
      ));
    }
    return Dialog(
      backgroundColor: CustomColors.almostBlack3,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Filtruj dane",
                style: TextStyle(color: CustomColors.gray, fontSize: 17)),
            const UserStatisticsSwitch(),
            const UserStatisticsHeader(
                title: "Egzamin zaliczony w okresie", topMargin: 8),
            const UserStatisticsSelectDateRange(),
            const UserStatisticsHeader(
              title: "Egzamin dla szkoleń",
            ),
            AddQuestionSelectItemsUI(
                searchVisible: false,
                itemsList: chapters,
                selectedItems: selectedChapters,
                onSelectedItemsChanged: onSelectedItemsChanged,
                labelExtractor: (chapter) {
                  return chapter.name;
                }),
          ],
        ),
      ),
    );
  }
}
