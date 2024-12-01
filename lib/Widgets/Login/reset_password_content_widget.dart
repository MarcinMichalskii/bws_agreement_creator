import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/default_bordered_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:bws_agreement_creator/utils/nip_validator.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordWidgetContent extends HookConsumerWidget {
  const ResetPasswordWidgetContent({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final email = useState('');
    final isLoading = ref.watch(resetPasswordProvider).isLoading;
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
        child: Column(children: [
          BorderedInput(
            validator: EmailValidator.validate,
            placeholder: 'Twój email z profilu Sinch',
            onChanged: (text) {
              email.value = text ?? '';
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: isLoading
                ? const CircularProgressIndicator(
                    color: CustomColors.applicationColorMain)
                : DefaultBorderedButton(
                    borderColor: email.value.isValidEmail()
                        ? CustomColors.applicationColorMain
                        : CustomColors.gray,
                    onTap: () {
                      if (email.value.isValidEmail()) {
                        ref
                            .read(resetPasswordProvider.notifier)
                            .resetPassword(email.value);
                      }
                    },
                    text: 'Zresetuj hasło'),
          ),
        ]),
      ),
    );
  }
}
