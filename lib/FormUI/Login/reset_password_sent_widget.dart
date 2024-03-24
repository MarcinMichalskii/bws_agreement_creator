import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordSentWidget extends HookConsumerWidget {
  const ResetPasswordSentWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        child: const Text('Link do resetu hasła został wysłany na twój email!',
            style: TextStyle(color: CustomColors.green, fontSize: 20)),
      ),
    );
  }
}
