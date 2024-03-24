import 'package:bws_agreement_creator/FormUI/Login/reset_password_content_widget.dart';
import 'package:bws_agreement_creator/FormUI/Login/reset_password_sent_widget.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordWidget extends HookConsumerWidget {
  const ResetPasswordWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final successMessage = ref.watch(resetPasswordProvider).data;

    return successMessage != null
        ? const ResetPasswordSentWidget()
        : const ResetPasswordWidgetContent();
  }
}
