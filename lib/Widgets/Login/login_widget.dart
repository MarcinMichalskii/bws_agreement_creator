import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bws_logo.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/default_bordered_button.dart';
import 'package:bws_agreement_creator/Widgets/Login/login_google_button_web.dart'
    if (dart.library.html) 'package:bws_agreement_creator/Widgets/Login/login_google_button_web.dart'
    if (dart.library.io) 'package:bws_agreement_creator/Widgets/Login/login_google_button_mobile.dart';
import 'package:bws_agreement_creator/Widgets/Login/no_password_help_widget.dart';
import 'package:bws_agreement_creator/app_config_helper.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:bws_agreement_creator/utils/nip_validator.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginWidget extends HookConsumerWidget {
  const LoginWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final passwordInvisible = useState(true);
    ref.listen(profileProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error!.message,
            )));
      }
    });

    ref.listen(authProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error!.message,
            )));
      }
    });

    ref.listen(resetPasswordProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text(next.error!.message)));
      }
    });
    final login = useState('');
    final password = useState('');

    final authorize = useCallback(() {
      ref.read(authProvider.notifier).login(login.value, password.value);
    }, [login.value, password.value]);

    final isInputValid =
        login.value.isValidEmail() && password.value.isNotEmpty;

    final onLoginPressed = useCallback(() {
      if (isInputValid) {
        authorize();
      }
    }, [isInputValid, authorize]);

    return Scaffold(
      backgroundColor: CustomColors.mainBackground,
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
                placeholder: 'Twój email do Sinch',
                validator: EmailValidator.validate,
                onChanged: (text) {
                  login.value = text ?? '';
                },
              ),
              BorderedInput(
                onSubmited: onLoginPressed,
                sufixIcon: IconButton(
                  icon: Icon(passwordInvisible.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    passwordInvisible.value = !passwordInvisible.value;
                  },
                ),
                placeholder: 'password'.tr(),
                isSecure: passwordInvisible.value,
                onChanged: (text) {
                  password.value = text ?? '';
                },
              ),
              ref.watch(authProvider).isLoading
                  ? Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: const CircularProgressIndicator(
                        color: CustomColors.applicationColorMain,
                      ))
                  : DefaultBorderedButton(
                      borderColor: isInputValid
                          ? CustomColors.applicationColorMain
                          : CustomColors.gray,
                      onTap: onLoginPressed,
                      text: isProd ? 'Login' : 'Dev Login'),
              LoginGoogleButtonWeb(),
              const NoPasswordHelpWidget()
            ]),
          ),
        ),
      ),
    );
  }
}
