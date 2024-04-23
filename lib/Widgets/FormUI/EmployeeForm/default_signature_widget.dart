import 'package:bws_agreement_creator/Widgets/FormUI/EmployeeForm/signature_widget.dart';
import 'package:bws_agreement_creator/Providers/new_form_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultSignatureWidget extends HookConsumerWidget {
  const DefaultSignatureWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SignatureWidget(onSignatureChanged: (data) {
      ref.read(newFormDataProvider.notifier).setSignature(data);
    });
  }
}
