import 'package:bws_agreement_creator/Model/chapter_data.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/trainings_onboarding_information.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/chapters_list.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/content_no_available.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/user_data_helper.dart';
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

    final showWelcomeMessage = useCallback(() {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const TrainingsOnboardingInformation());
    }, []);

    final showInitialWelcomeMessage = useCallback(() async {
      final seenAgreementPopup = await UserDataHelper().seenTrainingsPopup();
      if (!seenAgreementPopup) {
        showWelcomeMessage();
      }
    }, []);

    final isUserVerified = ref.watch(profileProvider).data?.verified ?? false;

    useBuildEffect(() {
      if (!isUserVerified) {
        return;
      }
      showInitialWelcomeMessage();
    }, []);

    return AppScaffold(
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 32),
          child: IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              showWelcomeMessage();
            },
          ),
        )
      ],
      title: isUserVerified ? "Lista szkoleń" : "",
      body: !isUserVerified
          ? ChaptersListWidget(
              lockUnpassed: true,
              chapters: chapters,
              onChapterOpen: onChapterOpen)
          : const ContentNoAvailableWidget(),
    );
  }
}
