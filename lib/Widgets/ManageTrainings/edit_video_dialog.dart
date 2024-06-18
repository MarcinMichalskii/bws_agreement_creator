import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/add_video_provider.dart';
import 'package:bws_agreement_creator/Providers/update_video_provider.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_video_dialog_ui.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:validators/validators.dart';

class EditVideoDialog extends HookConsumerWidget {
  final String chapterId;
  final VideoData videoData;
  const EditVideoDialog(
      {super.key, required this.chapterId, required this.videoData});

  @override
  Widget build(BuildContext context, ref) {
    final title = useState(videoData.name);
    final url = useState(videoData.url);
    final inputsValid = title.value.isNotEmpty && isURL(url.value);

    final onVideoTitleChanged = useCallback((String text) {
      title.value = text;
    }, []);

    final onUrlChanged = useCallback((String text) {
      url.value = text;
    }, []);

    final onSave = useCallback(() async {
      ref
          .read(updateVideoProvider.notifier)
          .updateVideo(title.value, url.value, chapterId, videoData.id);
    }, [
      title.value,
      url.value,
    ]);

    final isLoading = ref.watch(addVideoProvider).isLoading;
    ref.listen(updateVideoProvider, (previous, next) {
      if (next.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: CustomColors.applicationColorMain,
            content: Text('Video zostało zaktualizowane!')));
        Navigator.of(context).pop();
      }
    });

    return AddVideoDialogUI(
        popupTitle: 'Edytuj film',
        initialVideoTitle: videoData.name,
        initialUrl: videoData.url,
        onUrlChange: onUrlChanged,
        onVideoTitleChange: onVideoTitleChanged,
        isLoading: isLoading,
        inputsValid: inputsValid,
        onAddVideo: onSave);
  }
}
