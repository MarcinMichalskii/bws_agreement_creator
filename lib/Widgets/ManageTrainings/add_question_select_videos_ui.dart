import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddQuestionSelectVideosUI extends HookConsumerWidget {
  const AddQuestionSelectVideosUI({
    super.key,
    required this.videosList,
    required this.selectedVideos,
    required this.onSelectedVideosChanged,
  });

  final List<VideoData> videosList;
  final List<VideoData> selectedVideos;
  final ValueSetter<List<VideoData>> onSelectedVideosChanged;

  @override
  Widget build(BuildContext context, ref) {
    final filteredVideos = useState(videosList);
    return SingleChildScrollView(
      child: Column(children: [
        BorderedInput(
          placeholder: 'Wyszukaj film',
          initialValue: null,
          onChanged: (text) {
            final filtered = videosList
                .where((element) => element.name
                    .toLowerCase()
                    .contains((text ?? '').toLowerCase()))
                .toList();
            filteredVideos.value = filtered;
          },
        ),
        ...filteredVideos.value.asMap().entries.map((entry) {
          final video = entry.value;
          return TouchableOpacity(
            onTap: () {
              final newSelectedVideos = [...selectedVideos];
              if (newSelectedVideos.contains(video)) {
                newSelectedVideos.remove(video);
              } else {
                newSelectedVideos.add(video);
              }
              onSelectedVideosChanged(newSelectedVideos);
            },
            child: Container(
              color: CustomColors.mainBackground,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      video.name,
                      style: const TextStyle(color: CustomColors.gray),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    selectedVideos.contains(video)
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: selectedVideos.contains(video)
                        ? CustomColors.applicationColorMain
                        : Colors.grey,
                  ),
                ],
              ),
            ),
          );
        }),
      ]),
    );
  }
}
