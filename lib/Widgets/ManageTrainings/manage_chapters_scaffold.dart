import 'package:bws_agreement_creator/Model/chapter_data.dart';
import 'package:bws_agreement_creator/Providers/delete_chapter_provider.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_training_dialog.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/chapters_list.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/confirmation_dialog.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ManageChaptersScaffold extends HookConsumerWidget {
  const ManageChaptersScaffold({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final chapters = ref.watch(getChaptersProvider).data ?? [];
    useBuildEffect(() {
      ref.read(getChaptersProvider.notifier).getChapters();
      return null;
    }, []);

    final onChapterOpen = useCallback((ChapterData chapter) {
      context.pushScreen('manageChapterDetails',
          params: {'id': chapter.id}, queryParams: {'title': chapter.name});
    }, []);

    final onChapterDelete = useCallback((String id) {
      showDialog(
          context: context,
          builder: (context) {
            return ConfirmationDialog(
              onConfirm: () {
                ref.read(deleteChapterProvider.notifier).deleteChapter(id);
              },
            );
          });
    }, []);

    final isEditing = useState(false);

    return AppScaffold(
      title: "Zarządzaj szkoleniami",
      actions: [
        TouchableOpacity(
            onTap: () {
              isEditing.value = !isEditing.value;
            },
            child: const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.swap_vert))),
        TouchableOpacity(
            onTap: () {
              showDialog(
                  context: context, builder: (_) => const AddTrainingDialog());
            },
            child: const Padding(
                padding: EdgeInsets.only(right: 16), child: Icon(Icons.add)))
      ],
      body: ChaptersListWidget(
          chapters: chapters,
          onChapterOpen: onChapterOpen,
          onChapterDelete: onChapterDelete,
          isEditing: isEditing.value),
    );
  }
}

class PillButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;
  const PillButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.color = CustomColors.applicationColorMain});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color, foregroundColor: CustomColors.almostBlack),
        onPressed: onPress,
        child: Text(title),
      ),
    );
  }
}
