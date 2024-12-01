import 'package:bws_agreement_creator/Providers/check_examine_provider.dart';
import 'package:bws_agreement_creator/Providers/get_chapter_examine_provider.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/chapter_examine_finished_widget.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/components/examine_ui.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/examine_provider.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterExamineScaffold extends HookConsumerWidget {
  final String chapterId;
  final String chapterName;
  const ChapterExamineScaffold(
      {super.key, required this.chapterId, required this.chapterName});

  @override
  Widget build(BuildContext context, ref) {
    final isLoading = useState(true);
    final questionsList = ref.watch(getChapterExamineProvider(chapterId)).data;

    final examQuestions = ref.watch(examineProvider)?.questions ?? [];

    final chapterPassed = ref
            .read(getChaptersProvider)
            .data
            ?.where((element) => element.id == chapterId)
            .first
            .passed ==
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
      ref.read(getChapterExamineProvider(chapterId).notifier).getExamine();
      return null;
    }, []);

    final onFinishExam = useCallback(() {
      if (ref.read(examineProvider.notifier).state?.currentQuestionAnswered ==
          true) {
        ref
            .read(checkExamineProivder(chapterId).notifier)
            .checkExamine(questions: examQuestions);
      }
    }, [examQuestions]);

    final examResult = ref.watch(checkExamineProivder(chapterId)).data;

    final onExitExam = useCallback(() {
      if (examResult == null) {
        return;
      }

      if (examResult.passed) {
        Navigator.of(context).pop();
      }
      Navigator.of(context).pop();
    }, [examResult]);

    return AppScaffold(
        title: "Egzamin dla szkolenia $chapterName",
        body: examResult != null
            ? ChapterExamineFinishedWidget(
                passingAgain: chapterPassed,
                title: "Zamknij",
                chapterName: chapterName,
                onFinish: onExitExam,
                result: ref.watch(checkExamineProivder(chapterId)).data!,
                numberOfQuestions: examQuestions.length,
                outroUrl: ref
                    .read(getVideosProvider(chapterId).notifier)
                    .getOutroUrl(),
                surveyUrl: ref
                    .read(getChaptersProvider.notifier)
                    .getChapterForId(chapterId)
                    ?.surveyUrl,
              )
            : ExamineUI(
                onExamFinished: onFinishExam,
                isLoading: isLoading.value,
              ));
  }
}
