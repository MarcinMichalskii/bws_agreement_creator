import 'package:bws_agreement_creator/FormUI/NewUI/Login/no_password_help_widget.dart';
import 'package:bws_agreement_creator/FormUI/Providers/login_data_provider.dart';
import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginWidget extends HookConsumerWidget {
  final void Function(bool) onLoginTapped;
  const LoginWidget({super.key, required this.onLoginTapped});
  @override
  Widget build(BuildContext context, ref) {
    ref.listen(loginProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error!.message,
            )));
      }
    });
    final login = useState('');
    final password = useState('');

    final authorize = useCallback(() {
      ref.read(loginProvider.notifier).login(login.value, password.value);
    }, [login.value, password.value]);

    final isInputValid =
        login.value.isValidEmail() && password.value.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
            child: Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 64),
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: BwsLogo()),
              BorderedInput(
                placeholder: 'Sinch Email',
                onChanged: (text) {
                  login.value = text ?? '';
                },
              ),
              BorderedInput(
                placeholder: 'Password',
                isSecure: true,
                onChanged: (text) {
                  password.value = text ?? '';
                },
              ),
              ref.watch(loginProvider).isLoading
                  ? Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: const CircularProgressIndicator(
                        color: CustomColors.applicationColorMain,
                      ))
                  : DefaultBorderedButton(
                      borderColor: isInputValid
                          ? CustomColors.applicationColorMain
                          : CustomColors.gray,
                      onTap: () {
                        if (isInputValid) {
                          authorize();
                        }
                      },
                      text: 'Login'),
              const NoPasswordHelpWidget()
            ]),
          ),
        ),
      ),
    );
  }
}
