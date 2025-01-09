import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Components/raports_generator_header_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Components/raports_generator_toggle_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Providers/raport_generator_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AcceptanceWidget extends HookConsumerWidget {
  const AcceptanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final onAcceptanceToggle = useCallback((bool isOn) {
      ref.read(raportGeneratorProvider.notifier).setIsAcceptanceOn(isOn);
    }, []);
    final isAcceptanceOn = ref.watch(raportGeneratorProvider).isAcceptanceOn;
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: RaportsGeneratorHeaderWidget(
              text: 'acceptance'.tr(),
              onToggle: onAcceptanceToggle,
              isOn: isAcceptanceOn,
            )),
        if (isAcceptanceOn) ...[
          RaportsGeneratorToggleWidget(
            text: 'acceptService'.tr(),
            isOn: ref.watch(raportGeneratorProvider).acceptance,
            onToggle: (isOn) {
              ref.read(raportGeneratorProvider.notifier).setAcceptance(isOn);
            },
          ),
          BorderedInput(
            initialValue: ref.watch(raportGeneratorProvider).deffects,
            placeholder: "deffectsDescription".tr(),
            onChanged: (value) {
              ref
                  .read(raportGeneratorProvider.notifier)
                  .setDeffects(value ?? '');
            },
          ),
          BorderedInput(
            initialValue: ref.watch(raportGeneratorProvider).deffectsSolution,
            placeholder: "deffectsSolution".tr(),
            onChanged: (value) {
              ref
                  .read(raportGeneratorProvider.notifier)
                  .setDeffectsSolution(value ?? '');
            },
          ),
          Container(height: 8),
          RaportsGeneratorToggleWidget(
            text: 'deffectsResolved'.tr(),
            isOn: ref.watch(raportGeneratorProvider).deffectsResolved,
            onToggle: (isOn) {
              ref
                  .read(raportGeneratorProvider.notifier)
                  .setDeffectsResolved(isOn);
            },
          ),
        ]
      ],
    );
  }
}
