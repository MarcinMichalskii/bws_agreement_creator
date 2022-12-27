import 'package:bws_agreement_creator/colors.dart';
import 'package:flutter/material.dart';

class GeneratePdfButton extends StatelessWidget {
  const GeneratePdfButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
              width: 1.5, color: CustomColors.applicationColorMain),
        ),
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          child: const Text('Generuj dokument',
              style: TextStyle(
                  fontSize: 20,
                  color: CustomColors.gray,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
