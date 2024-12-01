import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/default_bordered_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/not_a_student_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UpdateStudentIdActionButtons extends StatelessWidget {
  const UpdateStudentIdActionButtons({
    super.key,
    required this.sendDisabled,
    required this.onTap,
  });

  final bool sendDisabled;
  final Null Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultBorderedButton(
            borderColor: sendDisabled
                ? CustomColors.gray
                : CustomColors.applicationColorMain,
            onTap: sendDisabled ? null : onTap,
            text: 'send'.tr()),
        NotAStudentButton(),
      ],
    );
  }
}
