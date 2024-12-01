import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Providers/update_student_id_photos_provider.dart';
import 'package:bws_agreement_creator/Providers/update_student_id_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/update_student_id_add_photos_row.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/update_student_id_date_picker.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/update_student_id_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/utils/Enums/student_status_error_reason.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateStudentIdLogic extends HookConsumerWidget {
  const UpdateStudentIdLogic({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final errorReason =
        ref.watch(profileProvider).data?.studentStatusErrorReason;
    final text =
        ref.watch(profileProvider).data?.studentStatusErrorReason?.errorText;
    final idNumber = useState('');
    final isLoading = ref.watch(updateStudentIdProvider).isLoading ||
        ref.watch(updateStudentIdPhotosProvider).isLoading ||
        ref.watch(profileProvider).isLoading;

    final expiryDate = ref.watch(studentIdExpiryDateProvider);
    final frontPhoto = ref.watch(frontPhotoProvider);
    final backPhoto = ref.watch(backPhotoProvider);

    bool sendDisabled() {
      final badId = RegExp(r'[^0-9\/\s]').hasMatch(idNumber.value) ||
          idNumber.value.isEmpty;
      if (errorReason == StudentStatusErrorReason.noPhoto) {
        if (frontPhoto == null || backPhoto == null) {
          return true;
        }
        if (expiryDate == null) {
          return true;
        }
      }
      return badId;
    }

    ref.listen(updateStudentIdProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error!.message,
            )));

        ref.read(appStateProvider.notifier).setIsLoggedIn(false);
      }
    });

    ref.listen(updateStudentIdPhotosProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error!.message,
            )));

        ref.read(appStateProvider.notifier).setIsLoggedIn(false);
      }
    });

    ref.listen(profileProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error!.message,
            )));

        ref.read(appStateProvider.notifier).setIsLoggedIn(false);
      }
    });

    final idUpdated = ref.watch(updateStudentIdProvider).data;
    final photosUpdated = ref.watch(updateStudentIdPhotosProvider).data;
    final updateReason =
        ref.watch(profileProvider).data?.studentStatusErrorReason;
    useBuildEffect(() {
      if (updateReason == null) {
        return;
      }
      if (updateReason != StudentStatusErrorReason.noPhoto) {
        if (idUpdated != null) {
          ref.read(profileProvider.notifier).getProfile();
          SnackbarHandler.showSnackBar("studentIdDataUpdated".tr(),
              color: Colors.green);
        }
      } else {
        if (idUpdated != null && photosUpdated != null) {
          ref.read(profileProvider.notifier).getProfile();
          SnackbarHandler.showSnackBar("studentIdDataUpdated".tr(),
              color: Colors.green);
        }
      }
      return null;
    }, [idUpdated, photosUpdated, updateReason]);

    final onTap = sendDisabled()
        ? null
        : useCallback(() {
            ref
                .read(updateStudentIdProvider.notifier)
                .updateStudentId(idNumber.value);
            if (updateReason == StudentStatusErrorReason.noPhoto) {
              ref
                  .read(updateStudentIdPhotosProvider.notifier)
                  .updateStudentIdPhotos(expiryDate!, frontPhoto!, backPhoto!);
            }
          }, [expiryDate, frontPhoto, backPhoto, idNumber.value, updateReason]);

    return UpdateStudentIdWidget(
        sendDisabled: sendDisabled(),
        errorReason: errorReason ?? StudentStatusErrorReason.noPhoto,
        text: text,
        idNumber: idNumber,
        isLoading: isLoading,
        onTap: onTap);
  }
}
