import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/default_bordered_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SendAgreementConfirmation extends StatelessWidget {
  const SendAgreementConfirmation({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.almostBlack2,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(16.0),
              child: _SendAgreementConfirmation(
                onConfirm: onConfirm,
              ),
            )),
      ),
    );
  }
}

class _SendAgreementConfirmation extends HookConsumerWidget {
  const _SendAgreementConfirmation({
    required this.onConfirm,
  });
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'warning'.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: CustomColors.gray,
              fontSize: 26,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Po podpisaniu umowy NIE zostaniesz zgłoszony do ZUS. Zgłoszenie następuje z dniem wykonania pierwszego zlecenia.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CustomColors.gray,
                fontSize: 18,
              ),
            ),
          ),
          DefaultBorderedButton(
            onTap: () {
              onConfirm();
            },
            text: 'ROZUMIEM',
          )
        ],
      ),
    );
  }
}
