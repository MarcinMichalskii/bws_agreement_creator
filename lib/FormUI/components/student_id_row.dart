import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/FormUI/components/select_photo_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StudentIdRow extends HookConsumerWidget {
  const StudentIdRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final frontImage = ref.watch(FormNotifier.provider).frontStudentIdImage;
    final onSelectFrontTapped = useCallback(() async {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      final image = result?.files.first.bytes;
      if (image != null) {
        ref
            .read(FormNotifier.provider.notifier)
            .setFrontStudentIdImage(Image.memory(image));
      }
    }, []);

    final onFrontRemoveTapped = useCallback(() {
      ref.read(FormNotifier.provider.notifier).setFrontStudentIdImage(null);
    }, []);

    final backImage = ref.watch(FormNotifier.provider).backStudentIdImage;
    final onSelectBackTapped = useCallback(() async {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      final image = result?.files.first.bytes;
      if (image != null) {
        ref
            .read(FormNotifier.provider.notifier)
            .setBackStudentIdImage(Image.memory(image));
      }
    }, []);

    final onBackRemoveTapped = useCallback(() {
      ref.read(FormNotifier.provider.notifier).setBackStudentIdImage(null);
    }, []);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        frontImage == null
            ? SelectPhotoButton(
                onTap: onSelectFrontTapped,
                title: 'Przód legitymacji',
              )
            : GestureDetector(
                onTap: onFrontRemoveTapped,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  constraints:
                      const BoxConstraints(maxHeight: 100, maxWidth: 140),
                  child: frontImage,
                ),
              ),
        backImage == null
            ? Container(
                margin: const EdgeInsets.only(left: 16),
                child: SelectPhotoButton(
                  onTap: onSelectBackTapped,
                  title: 'Tył legitymacji',
                ),
              )
            : GestureDetector(
                onTap: onBackRemoveTapped,
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  constraints:
                      const BoxConstraints(maxHeight: 100, maxWidth: 140),
                  child: backImage,
                ),
              ),
      ],
    );
  }
}
