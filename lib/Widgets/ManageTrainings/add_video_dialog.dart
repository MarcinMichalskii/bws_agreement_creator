import 'dart:async';
import 'dart:html' as html;

import 'package:bws_agreement_creator/Providers/add_video_provider.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_video_dialog_ui.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:validators/validators.dart';

class VideoDurationFetcher {
  String videoUrl;

  VideoDurationFetcher(this.videoUrl);

  Future<double> fetchVideoDuration() async {
    Completer<double> completer = Completer<double>();

    html.VideoElement videoElement = html.VideoElement()
      ..src = videoUrl
      ..style.display = 'none'; // Hide the video element

    html.document.body?.append(videoElement);

    videoElement.onLoadedMetadata.listen((event) {
      completer.complete(videoElement.duration.toDouble());
      videoElement.remove(); // Clean up: remove the video element from the DOM
    });

    return completer.future;
  }
}

class AddVideoDialog extends HookConsumerWidget {
  final String chapterId;
  const AddVideoDialog({super.key, required this.chapterId});

  @override
  Widget build(BuildContext context, ref) {
    final title = useState('');
    final url = useState('');
    final inputsValid = title.value.isNotEmpty && isURL(url.value);

    final onVideoTitleChanged = useCallback((String text) {
      title.value = text;
    }, []);

    final onUrlChanged = useCallback((String text) {
      url.value = text;
    }, []);

    final onAddVideo = useCallback(() async {
      ref
          .read(addVideoProvider.notifier)
          .addVideo(title.value, url.value, chapterId);
    }, [
      title.value,
      url.value,
    ]);

    final isLoading = ref.watch(addVideoProvider).isLoading;
    ref.listen(addVideoProvider, (previous, next) {
      if (next.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: CustomColors.applicationColorMain,
            content: Text('Dodano nowe video')));
        Navigator.of(context).pop();
      }
    });

    return AddVideoDialogUI(
        popupTitle: 'Nowe video',
        initialVideoTitle: title.value,
        initialUrl: url.value,
        onUrlChange: onUrlChanged,
        onVideoTitleChange: onVideoTitleChanged,
        isLoading: isLoading,
        inputsValid: inputsValid,
        onAddVideo: onAddVideo);
  }
}
