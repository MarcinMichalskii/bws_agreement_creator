import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class ValidationError extends StatelessWidget {
  final String errorText;
  const ValidationError({
    super.key,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
            width: 480,
            height: 160,
            constraints: const BoxConstraints(maxWidth: 380),
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.almostBlack2,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(16.0),
              child: _ValidationErrorContainer(errorText: errorText),
            )),
      ),
    );
  }
}

class _ValidationErrorContainer extends StatelessWidget {
  final String errorText;
  const _ValidationErrorContainer({
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Błąd',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.red,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            errorText,
            style: const TextStyle(
              color: CustomColors.gray,
              fontSize: 13,
            ),
          ),
        ),
        DefaultBorderedButton(
          onTap: () {
            Navigator.pop(context);
          },
          text: 'OK!',
        )
      ],
    );
  }
}
