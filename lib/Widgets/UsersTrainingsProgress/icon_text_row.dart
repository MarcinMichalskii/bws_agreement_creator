import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;

  const IconTextRow({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: CustomColors.applicationColorMain,
            size: iconSize,
          ),
          const SizedBox(width: 4.0),
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: CustomColors.gray),
          ),
        ],
      ),
    );
  }
}
