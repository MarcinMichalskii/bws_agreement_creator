import 'dart:typed_data';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/UpdateStudentId/Components/update_student_id_date_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:file_picker/file_picker.dart';

final frontPhotoProvider = StateProvider.autoDispose<Uint8List?>((ref) => null);
final backPhotoProvider = StateProvider.autoDispose<Uint8List?>((ref) => null);

class UpdateStudentIdAddPhotosRow extends HookConsumerWidget {
  const UpdateStudentIdAddPhotosRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final frontPhoto = ref.watch(frontPhotoProvider);
    final backPhoto = ref.watch(backPhotoProvider);

    Future<void> pickImage(bool isFront) async {
      if (ref.read(frontPhotoProvider) != null && isFront) {
        ref.read(frontPhotoProvider.notifier).state = null;
        return;
      } else if (ref.read(backPhotoProvider) != null && !isFront) {
        ref.read(backPhotoProvider.notifier).state = null;
        return;
      }

      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );
      if (result != null && result.files.isNotEmpty) {
        if (isFront) {
          ref.read(frontPhotoProvider.notifier).state =
              result.files.first.bytes;
        } else {
          ref.read(backPhotoProvider.notifier).state = result.files.first.bytes;
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PhotoBoxWidget(
              label: 'frontPhoto'.tr(),
              photo: frontPhoto,
              onTap: () => pickImage(true),
            ),
            Container(
              width: 16,
            ),
            PhotoBoxWidget(
              label: 'backPhoto'.tr(),
              photo: backPhoto,
              onTap: () => pickImage(false),
            ),
          ],
        ),
        Container(
          height: 8,
        ),
        DatePickerWidget(placeholder: "expiryDate".tr()),
      ],
    );
  }
}

class PhotoBoxWidget extends StatelessWidget {
  const PhotoBoxWidget({
    super.key,
    required this.label,
    required this.photo,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String label;
  final Uint8List? photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: photo != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
                      photo!,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
      ),
    );
  }
}
