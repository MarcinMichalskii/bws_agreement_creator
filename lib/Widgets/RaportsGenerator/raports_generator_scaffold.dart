import 'package:bws_agreement_creator/Model/raport_generator_data.dart';
import 'package:bws_agreement_creator/Providers/get_raport_config_provider.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Providers/upload_raport_provider.dart';
import 'package:bws_agreement_creator/Widgets/Components/yes_no_dialog.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Providers/raport_generator_provider.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/raports_generator_widget.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:bws_agreement_creator/utils/user_data_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RaportsGeneratorScaffold extends HookConsumerWidget {
  const RaportsGeneratorScaffold({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final resetForm = useCallback(() {
      final userName = ref.read(profileProvider).data?.name ?? '';
      ref
          .read(raportGeneratorProvider.notifier)
          .reset(defaultManager: userName);
    }, []);

    ref.listen(uploadRaportProvider, (previous, next) {
      if (next.isLoading) return;
      if (next.data != null) {
        SnackbarHandler.showSnackBar("raportSent".tr(),
            color: CustomColors.darkGreen);
        resetForm();
      }
      if (next.error != null) {
        SnackbarHandler.showSnackBar(
            next.error?.message ?? 'somethingWentWrong'.tr(),
            color: Colors.red);
      }
    });

    final fetchStoredRaport = useCallback(() async {
      final data = await UserDataHelper().getGenerateRaportData();
      ref.read(raportGeneratorProvider.notifier).setRaport(data);
    }, []);

    useBuildEffect(() {
      fetchStoredRaport();
      return null;
    }, []);

    ref.listen<RaportGeneratorData>(
      raportGeneratorProvider,
      (previous, next) async {
        await UserDataHelper().storeGenerateRaportData(next);
      },
    );

    final showConfirmationPopup = useCallback(() {
      showDialog(
          context: context,
          builder: (context) {
            return YesNoDialog(
                onConfirm: () {
                  resetForm();
                },
                text: 'Na pewno utworzyć nowy raport?');
          });
    }, []);

    final isConfigLoading = ref.watch(getRaportConfigProvider).isLoading;
    if (isConfigLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (ref.watch(getRaportConfigProvider).error != null) {
      return Center(
        child: Text('somethingWentWrong'.tr(),
            style: TextStyle(color: CustomColors.gray)),
      );
    }

    return AppScaffold(
      actions: [
        IconButton(
            onPressed: () {
              showConfirmationPopup();
            },
            icon: Icon(Icons.restore_page_outlined))
      ],
      title: 'raportsGenerator'.tr(),
      body: SingleChildScrollView(
          physics: ref.watch(scrollEnabled)
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: Align(
              alignment: Alignment.topCenter,
              child: RaportsGeneratorWidget(
                key: ValueKey(ref.watch(raportGeneratorProvider).id),
              ))),
    );
  }
}
