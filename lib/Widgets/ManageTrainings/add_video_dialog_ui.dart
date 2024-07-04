import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/url_validator.dart';
import 'package:flutter/material.dart';

class AddVideoDialogUI extends StatelessWidget {
  const AddVideoDialogUI(
      {super.key,
      required this.popupTitle,
      required this.initialVideoTitle,
      required this.initialUrl,
      required this.onUrlChange,
      required this.onVideoTitleChange,
      required this.isLoading,
      required this.inputsValid,
      required this.onAddVideo,
      required this.isOutro,
      required this.onIsOutroChange});

  final String popupTitle;
  final String initialVideoTitle;
  final String initialUrl;
  final ValueSetter<String> onVideoTitleChange;
  final ValueSetter<String> onUrlChange;
  final bool isLoading;
  final bool inputsValid;
  final bool isOutro;
  final VoidCallback onAddVideo;
  final ValueSetter<bool> onIsOutroChange;

  @override
  Widget build(BuildContext context) {
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
              initialValue: initialVideoTitle,
              placeholder: 'Tytuł filmu',
              onChanged: (text) {
                onVideoTitleChange(text ?? '');
              },
            ),
            BorderedInput(
              initialValue: initialUrl,
              validator: UrlValidator.isValid,
              placeholder: 'Adres url filmu',
              onChanged: (text) {
                onUrlChange(text ?? '');
              },
            ),
            // text with toggle
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  const Text('Outro',
                      style: TextStyle(color: CustomColors.gray, fontSize: 17)),
                  const SizedBox(width: 16),
                  Switch(
                    value: isOutro,
                    onChanged: onIsOutroChange,
                    activeColor: CustomColors.applicationColorMain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            isLoading
                ? const CircularProgressIndicator(
                    color: CustomColors.applicationColorMain)
                : DefaultBorderedButton(
                    text: "Zapisz",
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
