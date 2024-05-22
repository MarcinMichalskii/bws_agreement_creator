import 'package:bws_agreement_creator/Model/chapter_data.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Widgets/Components/default_list_element.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

class ChaptersListWidget extends HookConsumerWidget {
  final List<ChapterData> chapters;
  final ValueSetter<String>? onChapterDelete;
  final ValueSetter<ChapterData> onChapterOpen;
  final bool isEditing;
  final bool lockUnpassed;
  const ChaptersListWidget(
      {super.key,
      this.lockUnpassed = false,
      required this.chapters,
      this.onChapterDelete,
      required this.onChapterOpen,
      this.isEditing = false});

  @override
  Widget build(BuildContext context, ref) {
    return isEditing
        ? ReordableChapters(chapters: chapters, onChapterOpen: onChapterOpen)
        : StandardChapters(
            lockUnpassed: lockUnpassed,
            chapters: chapters,
            onChapterOpen: onChapterOpen,
            onChapterDelete: onChapterDelete,
          );
  }
}

class StandardChapters extends HookConsumerWidget {
  final List<ChapterData> chapters;
  final ValueSetter<String>? onChapterDelete;
  final ValueSetter<ChapterData> onChapterOpen;
  final bool lockUnpassed;
  const StandardChapters(
      {super.key,
      required this.lockUnpassed,
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
                children: chapters.mapIndexed((index, chapter) {
                  return DefaultListElement(
                      locked: lockUnpassed &&
                          ref
                              .read(getChaptersProvider.notifier)
                              .isChapterLocked(chapter.id),
                      title: chapter.name,
                      passed: chapter.passed,
                      onElementTapped: () {
                        onChapterOpen(chapter);
                      },
                      onElementDelete: onChapterDelete != null
                          ? () {
                              onChapterDelete!(chapter.id);
                            }
                          : null);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReordableChapters extends HookConsumerWidget {
  final List<ChapterData> chapters;
  final ValueSetter<String>? onChapterDelete;
  final ValueSetter<ChapterData> onChapterOpen;
  const ReordableChapters(
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
            child: ReorderableListView(
              buildDefaultDragHandles: false,
              onReorder: (int oldIndex, int newIndex) {
                ref
                    .read(getChaptersProvider.notifier)
                    .reorderChapters(oldIndex, newIndex);
              },
              children: chapters.map((chapter) {
                return ReorderableDragStartListener(
                  key: ValueKey(chapter.id),
                  index: chapters.indexOf(chapter),
                  child: DefaultListElement(
                      isReordering: true,
                      title: chapter.name,
                      passed: chapter.passed,
                      onElementTapped: () {},
                      onElementDelete: null),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
