import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class ExamineNavigationButton extends StatelessWidget {
  const ExamineNavigationButton({
    super.key,
    required this.title,
    required this.enabled,
    required this.onPress,
  });

  final String title;
  final bool enabled;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return PillButton(
        color: enabled ? CustomColors.applicationColorMain : CustomColors.gray,
        title: title,
        onPress: onPress);
  }
}
