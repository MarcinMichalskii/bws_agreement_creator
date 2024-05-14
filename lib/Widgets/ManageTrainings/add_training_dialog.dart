import 'package:bws_agreement_creator/Providers/add_chapter_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTrainingDialog extends HookConsumerWidget {
  const AddTrainingDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final title = useState('');
    final onAddChapter = useCallback(() {
      ref.read(addChapterProvider.notifier).addChapter(title.value);
    }, [title.value]);
    final isLoading = ref.watch(addChapterProvider).isLoading;
    ref.listen(addChapterProvider, (previous, next) {
      if (next.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: CustomColors.applicationColorMain,
            content: Text('Dodano nowy rozdział')));
        Navigator.of(context).pop();
      }
    });

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
              placeholder: 'Tytuł rozdziału',
              onChanged: (text) {
                title.value = text ?? '';
              },
            ),
            const SizedBox(height: 16),
            isLoading
                ? const CircularProgressIndicator(
                    color: CustomColors.applicationColorMain)
                : DefaultBorderedButton(
                    text: "Dodaj rozdział",
                    borderColor: title.value.isEmpty
                        ? CustomColors.gray
                        : CustomColors.applicationColorMain,
                    onTap: title.value.isEmpty ? null : onAddChapter),
          ],
        ),
      ),
    );
  }
}
