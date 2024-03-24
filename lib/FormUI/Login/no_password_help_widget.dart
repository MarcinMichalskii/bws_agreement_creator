import 'package:bws_agreement_creator/FormUI/Login/reset_password_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoPasswordHelpWidget extends HookConsumerWidget {
  const NoPasswordHelpWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final isResetPasswordVisible = useState(false);
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 32),
        constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
        child: Column(children: [
          if (!isResetPasswordVisible.value)
            const Text(
                'JEŚLI ZAREJESTROWAŁEŚ SIĘ PRZY POMOCY GOOGLE LUB FACEBOOK, ZRESETUJ SWOJE HASŁO.',
                style: TextStyle(color: CustomColors.gray, fontSize: 20)),
          if (!isResetPasswordVisible.value)
            TextButton(
                onPressed: () {
                  isResetPasswordVisible.value = true;
                },
                child: const Text('RESET HASŁA',
                    style: TextStyle(
                        color: CustomColors.lightGray,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        decorationColor: CustomColors.lightGray))),
          if (isResetPasswordVisible.value) const ResetPasswordWidget(),
        ]),
      ),
    );
  }
}
