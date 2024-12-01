import 'package:bws_agreement_creator/Widgets/Components/loading_indicator.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/update_student_id_action_buttons.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/update_student_id_add_photos_row.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/update_student_id_text.dart';
import 'package:bws_agreement_creator/utils/Enums/student_status_error_reason.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UpdateStudentIdWidget extends StatelessWidget {
  const UpdateStudentIdWidget({
    super.key,
    required this.errorReason,
    required this.sendDisabled,
    required this.text,
    required this.idNumber,
    required this.isLoading,
    required this.onTap,
  });

  final StudentStatusErrorReason errorReason;
  final bool sendDisabled;
  final String? text;
  final ValueNotifier<String> idNumber;
  final bool isLoading;
  final Null Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              constraints:
                  const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
              child: Column(children: [
                UpdateStudentIdText(text: text),
                BorderedInput(
                  placeholder: 'studentIdNumber'.tr(),
                  onChanged: (text) {
                    idNumber.value = text ?? '';
                  },
                ),
                if (errorReason == StudentStatusErrorReason.noPhoto)
                  UpdateStudentIdAddPhotosRow(),
                if (errorReason == StudentStatusErrorReason.noPhoto)
                  const SizedBox(height: 16),
                isLoading
                    ? LoadingIndicator()
                    : UpdateStudentIdActionButtons(
                        sendDisabled: sendDisabled, onTap: onTap)
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
