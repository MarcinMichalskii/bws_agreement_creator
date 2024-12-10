import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Providers/update_permanent_residence_photos_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdatePermanentResidence/update_permanent_residence_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/update_student_id_add_photos_row.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/update_student_id_date_picker.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdatePermanentResidenceLogic extends HookConsumerWidget {
  const UpdatePermanentResidenceLogic({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isLoading =
        ref.watch(updatePermanentResidencePhotosProvider).isLoading ||
            ref.watch(profileProvider).isLoading;

    final expiryDate = ref.watch(studentIdExpiryDateProvider);
    final frontPhoto = ref.watch(frontPhotoProvider);
    final backPhoto = ref.watch(backPhotoProvider);

    bool sendDisabled() {
      return expiryDate == null || frontPhoto == null || backPhoto == null;
    }

    ref.listen(updatePermanentResidencePhotosProvider, (previous, next) {
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

    final photosUpdated =
        ref.watch(updatePermanentResidencePhotosProvider).data;

    useBuildEffect(() {
      if (photosUpdated != null) {
        ref.read(profileProvider.notifier).getProfile();
        SnackbarHandler.showSnackBar("permanentResidenceUpdated".tr(),
            color: Colors.green);
      }

      return null;
    }, [photosUpdated]);

    final onTap = sendDisabled()
        ? null
        : useCallback(() {
            ref
                .read(updatePermanentResidencePhotosProvider.notifier)
                .update(expiryDate!, frontPhoto!, backPhoto!);
          }, [expiryDate, frontPhoto, backPhoto]);

    return UpdatePermanentResidenceWiget(
        sendDisabled: sendDisabled(), isLoading: isLoading, onTap: onTap);
  }
}
