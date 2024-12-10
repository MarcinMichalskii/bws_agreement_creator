import 'package:bws_agreement_creator/Model/profile_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/action_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/information_frame_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/user_data_validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdatePersonalDataWidget extends HookConsumerWidget {
  final List<FieldsToRepair> fieldsToRepair;
  final ValueSetter<String?> onPeselChanged;
  final ValueSetter<String?> onIdNumberChanged;
  final ValueSetter<String?> onPassportIdChanged;
  final ValueSetter<String?> onAddressChanged;

  final VoidCallback onSendPressed;
  final bool sendEnabled;
  final bool isLoading;
  final bool passportModeSelected;
  final ValueSetter<bool> onPassportModeSelected;

  const UpdatePersonalDataWidget({
    super.key,
    required this.fieldsToRepair,
    required this.onPeselChanged,
    required this.onIdNumberChanged,
    required this.onPassportIdChanged,
    required this.onAddressChanged,
    required this.sendEnabled,
    required this.isLoading,
    required this.onSendPressed,
    required this.passportModeSelected,
    required this.onPassportModeSelected,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "lackingData".tr(),
              style: const TextStyle(color: CustomColors.gray, fontSize: 14),
              textAlign: TextAlign.left,
            )
          ],
        ),
        if (fieldsToRepair.contains(FieldsToRepair.pesel))
          BorderedInput(
              placeholder: "pesel".tr(),
              validator: PeselValidator.validate,
              onChanged: onPeselChanged),
        BorderedInput(
            placeholder:
                passportModeSelected ? "passportNumber".tr() : "idNumber".tr(),
            validator: passportModeSelected
                ? PassportValidator.validate
                : IDNUmberValidator.validate,
            onChanged:
                passportModeSelected ? onPassportIdChanged : onIdNumberChanged),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              const Text('Wolę podać nr paszportu',
                  style: TextStyle(color: CustomColors.gray, fontSize: 17)),
              const SizedBox(width: 16),
              Switch(
                value: passportModeSelected,
                onChanged: onPassportModeSelected,
                activeColor: CustomColors.applicationColorMain,
              ),
            ],
          ),
        ),
        if (fieldsToRepair.contains(FieldsToRepair.address))
          BorderedInput(
              placeholder: "streetAndNumber".tr(),
              validator: StreetValidator.validate,
              onChanged: onAddressChanged),
        Container(
          margin: EdgeInsets.only(top: 12),
          child: ActionButton(
            isLoading: isLoading,
            onTap: onSendPressed,
            isDisabled: !sendEnabled,
            text: "send".tr(),
          ),
        )
      ],
    );
  }
}
