import 'package:bws_agreement_creator/FormUI/Providers/login_data_provider.dart';
import 'package:bws_agreement_creator/Model/login_data.dart';
import 'package:bws_agreement_creator/Model/new_form_data.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newFormDataProvider =
    StateNotifierProvider<NewFormNotifier, NewFormData>((ref) {
  return NewFormNotifier(ref);
});

class NewFormNotifier extends StateNotifier<NewFormData> {
  StateNotifierProviderRef<NewFormNotifier, NewFormData> ref;
  NewFormNotifier(this.ref) : super(NewFormData());

  void setLoginData(LoginData loginData) {
    state = state.copyWith(loginData: loginData);
  }

  void setAddress(String address) {
    state = state.copyWith(b2bCompanyAddress: address);
  }

  void setNip(String nip) {
    state = state.copyWith(b2bCompanyNip: nip);
  }

  void setSignature(Uint8List? signature) {
    state = state.copyWith(signatureData: signature);
  }

  void setLegalGuardianSignature(Uint8List? signature) {
    state = state.copyWith(legalGuardianSignatureData: signature);
  }

  void updateCompanyName(String companyName) {
    state = state.copyWith(b2bCompanyName: companyName);
  }

  void updateOtherCompanyName(String companyName) {
    state = state.copyWith(otherCompanyName: companyName);
  }

  void updateOtherCompanyNip(String nip) {
    state = state.copyWith(otherCompanyNip: nip);
  }

  void updateOtherCompanyAddress(String address) {
    state = state.copyWith(otherCompanyAddress: address);
  }

  void updateOtherCompanyContractStartDate(DateTime date) {
    state = state.copyWith(otherCompanyStartDate: date);
  }

  void updateOtherCompanyContractEndDate(DateTime? date) {
    state = state.copyWith(otherCompanyEndDate: date);
  }

  void cleanUp() {
    state = NewFormData(loginData: ref.read(loginProvider.notifier).state.data);
  }
}
