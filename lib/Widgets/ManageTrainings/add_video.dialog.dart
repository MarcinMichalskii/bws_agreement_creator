import 'package:bws_agreement_creator/Providers/add_video_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/url_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:validators/validators.dart';

class AddVideoDialog extends HookConsumerWidget {
  final String chapterId;
  const AddVideoDialog({super.key, required this.chapterId});

  @override
  Widget build(BuildContext context, ref) {
    final title = useState('');
    final url = useState('');
    final inputsValid = title.value.isNotEmpty && isURL(url.value);

    final onAddVideo = useCallback(() {
      ref
          .read(addVideoProvider.notifier)
          .addVideo(title.value, url.value, chapterId);
    }, [title.value, url.value]);

    final isLoading = ref.watch(addVideoProvider).isLoading;
    ref.listen(addVideoProvider, (previous, next) {
      if (next.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: CustomColors.applicationColorMain,
            content: Text('Dodano nowe video')));
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
            const Text('Nowe video',
                style: TextStyle(color: CustomColors.gray, fontSize: 17)),
            const SizedBox(height: 16),
            BorderedInput(
              placeholder: 'Tytuł filmu',
              onChanged: (text) {
                title.value = text ?? '';
              },
            ),
            BorderedInput(
              validator: UrlValidator.isValid,
              placeholder: 'Adres url filmu',
              onChanged: (text) {
                url.value = text ?? '';
              },
            ),
            const SizedBox(height: 16),
            isLoading
                ? const CircularProgressIndicator(
                    color: CustomColors.applicationColorMain)
                : DefaultBorderedButton(
                    text: "Dodaj video",
                    borderColor: !inputsValid
                        ? CustomColors.gray
                        : CustomColors.applicationColorMain,
                    onTap: !inputsValid ? null : onAddVideo),
          ],
        ),
      ),
    );
  }
}