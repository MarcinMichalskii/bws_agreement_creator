import 'package:bws_agreement_creator/Providers/add_chapter_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/default_bordered_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTrainingDialog extends HookConsumerWidget {
  const AddTrainingDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final title = useState('');
    final badgeId = useState('');
    final surveyUrl = useState('');
    final onAddChapter = useCallback(() {
      ref.read(addChapterProvider.notifier).addChapter(
          chapterTitle: title.value,
          badgeId: badgeId.value,
          surveyUrl: surveyUrl.value);
    }, [title.value]);
    final isLoading = ref.watch(addChapterProvider).isLoading;
    ref.listen(addChapterProvider, (previous, next) {
      if (next.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: CustomColors.applicationColorMain,
            content: Text('Dodano nowe szkolenie')));
        Navigator.of(context).pop();
      }
    });

    final inputsValid = title.value.isNotEmpty &&
        badgeId.value.isNotEmpty &&
        surveyUrl.value.isValidSurveyUrl();

    return Dialog(
      backgroundColor: CustomColors.almostBlack3,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 200),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Nowe szkolenie',
                style: TextStyle(color: CustomColors.gray, fontSize: 17)),
            const SizedBox(height: 16),
            BorderedInput(
              placeholder: 'Tytuł szkolenia',
              onChanged: (text) {
                title.value = text ?? '';
              },
            ),
            BorderedInput(
              placeholder: 'Identyfikator odznaki',
              onChanged: (text) {
                badgeId.value = text ?? '';
              },
            ),
            BorderedInput(
              placeholder: 'Adres URL ankiety',
              onChanged: (text) {
                surveyUrl.value = text ?? '';
              },
            ),
            const SizedBox(height: 16),
            isLoading
                ? const CircularProgressIndicator(
                    color: CustomColors.applicationColorMain)
                : DefaultBorderedButton(
                    text: "Dodaj szkolenie",
                    borderColor: !inputsValid
                        ? CustomColors.gray
                        : CustomColors.applicationColorMain,
                    onTap: !inputsValid ? null : onAddChapter),
          ],
        ),
      ),
    );
  }
}
