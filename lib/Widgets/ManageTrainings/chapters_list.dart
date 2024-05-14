import 'package:bws_agreement_creator/Model/chapter_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChaptersListWidget extends HookConsumerWidget {
  final List<ChapterData> chapters;
  final ValueSetter<String>? onChapterDelete;
  final ValueSetter<ChapterData> onChapterOpen;
  const ChaptersListWidget(
      {super.key,
      required this.chapters,
      this.onChapterDelete,
      required this.onChapterOpen});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: chapters.map((chapter) {
                  return TouchableOpacity(
                    onTap: () {
                      onChapterOpen(chapter);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: CustomColors.almostBlack2,
                              child: Row(
                                children: [
                                  Icon(Icons.book,
                                      color: chapter.passed
                                          ? CustomColors.green
                                          : CustomColors.darkGray),
                                  Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    child: Text(chapter.name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: CustomColors.gray)),
                                  ),
                                  const Spacer(),
                                  if (onChapterDelete != null)
                                    TouchableOpacity(
                                        onTap: () {
                                          onChapterDelete!(chapter.id);
                                        },
                                        child: const Icon(Icons.delete,
                                            color: CustomColors.darkGray)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
