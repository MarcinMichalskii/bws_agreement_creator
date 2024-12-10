import 'package:bws_agreement_creator/Model/profile_data.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/update_profile_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdatePersonalData/update_personald_data_widget.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:bws_agreement_creator/utils/user_data_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdatePersonalDataLogic extends HookConsumerWidget {
  const UpdatePersonalDataLogic({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final fieldsToRepair =
        ref.watch(profileProvider).data?.fieldsToRepair ?? [];
    final pesel = useState<String>('');

    final passportModeState = useState(false);
    final documentNumber = useState<String>('');
    final idNumber = useState('');
    final passportId = useState('');

    useBuildEffect(() {
      idNumber.value = passportModeState.value ? '' : documentNumber.value;
      passportId.value = passportModeState.value ? documentNumber.value : '';
    }, [
      documentNumber.value,
      passportModeState.value,
    ]);
    final address = useState<String>('');

    final onConfirmPressed = useCallback(() {
      ref.read(updateProfileDataProvider.notifier).updateProfile(
          idNumber.value, passportId.value, pesel.value, address.value);
    }, [
      idNumber.value,
      passportId.value,
      pesel.value,
      address.value,
    ]);

    final bool sendEnabled = () {
      if (fieldsToRepair.contains(FieldsToRepair.pesel) &&
          PeselValidator.validate(pesel.value) != null) {
        return false;
      }
      if (fieldsToRepair.contains(FieldsToRepair.idNumber) &&
          IDNUmberValidator.validate(idNumber.value) != null &&
          !passportModeState.value) {
        return false;
      }

      if (fieldsToRepair.contains(FieldsToRepair.passportId) &&
          PassportValidator.validate(passportId.value) != null &&
          passportModeState.value) {
        return false;
      }

      if (fieldsToRepair.contains(FieldsToRepair.address) &&
          StreetValidator.validate(address.value) != null) {
        return false;
      }

      return true;
    }();

    final onPassportModeChanged = useCallback((bool value) {
      passportModeState.value = value;
    }, [passportModeState.value]);

    final isLoading = ref.watch(updateProfileDataProvider).isLoading ||
        ref.watch(profileProvider).isLoading;
    final dataUpdated = ref.watch(updateProfileDataProvider).data;

    useBuildEffect(() {
      if (dataUpdated != null) {
        ref.read(profileProvider.notifier).getProfile();
      }
    }, [dataUpdated]);

    return UpdatePersonalDataWidget(
        isLoading: isLoading,
        fieldsToRepair: fieldsToRepair,
        onPeselChanged: (value) {
          pesel.value = value ?? '';
        },
        onIdNumberChanged: (value) {
          documentNumber.value = value ?? '';
        },
        onPassportIdChanged: (value) {
          documentNumber.value = value ?? '';
        },
        onAddressChanged: (value) {
          address.value = value ?? '';
        },
        sendEnabled: sendEnabled,
        onSendPressed: onConfirmPressed,
        passportModeSelected: passportModeState.value,
        onPassportModeSelected: onPassportModeChanged);
  }
}
