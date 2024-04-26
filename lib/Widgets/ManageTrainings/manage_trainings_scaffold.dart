import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_training_dialog.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ManageTraingsScaffold extends HookConsumerWidget {
  const ManageTraingsScaffold({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final chapters = ref.watch(getChaptersProvider).data ?? [];
    useBuildEffect(() {
      ref.read(getChaptersProvider.notifier).getChapters();
    }, []);

    return AppScaffold(
      title: "Zarządzaj szkoleniami",
      actions: [
        TouchableOpacity(
            onTap: () {
              showDialog(
                  context: context, builder: (_) => const AddTrainingDialog());
            },
            child: const Padding(
                padding: EdgeInsets.only(right: 16), child: Icon(Icons.add)))
      ],
      body: SingleChildScrollView(
        child: Column(
          children: chapters.map((e) {
            return Text(e.name,
                style: const TextStyle(fontSize: 20, color: Colors.white));
          }).toList(),
        ),
      ),
    );
  }
}
