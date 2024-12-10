import 'package:bws_agreement_creator/Widgets/Components/loading_indicator.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/default_bordered_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/information_frame_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/update_student_id_add_photos_row.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UpdatePermanentResidenceWiget extends StatelessWidget {
  const UpdatePermanentResidenceWiget({
    super.key,
    required this.sendDisabled,
    required this.isLoading,
    required this.onTap,
  });

  final bool sendDisabled;
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
                Text(
                  'addPermanentResidence'.tr(),
                  style:
                      const TextStyle(color: CustomColors.gray, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                InformationFrameWidget(
                  text: 'noPermanentResidenceExplenation'.tr(),
                ),
                UpdateStudentIdAddPhotosRow(),
                const SizedBox(height: 16),
                isLoading
                    ? LoadingIndicator()
                    : DefaultBorderedButton(
                        borderColor: sendDisabled
                            ? CustomColors.gray
                            : CustomColors.applicationColorMain,
                        onTap: sendDisabled ? null : onTap,
                        text: 'send'.tr()),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
