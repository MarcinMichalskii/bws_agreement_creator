import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class B2BEmployeeQuestions extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final provider = FormNotifier.provider;
    final nip = ref.watch(provider).nip;
    return Column(children: [
      BorderedInput(
        placeholder: "Nazwa firmy",
        onChanged: (value) {
          ref.read(provider.notifier).setCompanyName(value ?? '');
        },
      ),
      BorderedInput(
        placeholder: "NIP",
        errorText: nip.isValidNip() ? null : "Nieprawidłowy nip",
        onChanged: (value) {
          ref.read(provider.notifier).setCompanyNip(value ?? '');
        },
      ),
    ]);
  }
}
