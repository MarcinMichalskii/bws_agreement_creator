import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class SelectPhotoButton extends StatelessWidget {
  const SelectPhotoButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
              width: 1.5, color: CustomColors.applicationColorMain),
        ),
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
          child: Text(title,
              style: const TextStyle(
                  fontSize: 14,
                  color: CustomColors.gray,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
