import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_question_body_ui.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_select_videos_ui.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_draft.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImportQuestionsDialogUI extends HookConsumerWidget {
  final String chapterId;

  const ImportQuestionsDialogUI({
    super.key,
    required this.chapterId,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Dialog(
      backgroundColor: CustomColors.almostBlack3,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Import pytań",
                style: const TextStyle(color: CustomColors.gray, fontSize: 17)),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            DefaultBorderedButton(
                text: "Zapisz",
                borderColor: CustomColors.applicationColorMain,
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
