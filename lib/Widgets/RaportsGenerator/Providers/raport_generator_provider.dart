import 'dart:convert';

import 'package:bws_agreement_creator/Model/exact_date.dart';
import 'package:bws_agreement_creator/Model/raport_generator_data.dart';
import 'package:bws_agreement_creator/Model/raport_location_data.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final raportGeneratorProvider =
    StateNotifierProvider<RaportGeneratorDataNotifier, RaportGeneratorData>(
        (ref) {
  return RaportGeneratorDataNotifier(ref);
});

class RaportGeneratorDataNotifier extends StateNotifier<RaportGeneratorData> {
  Ref<RaportGeneratorData> ref;
  RaportGeneratorDataNotifier(this.ref) : super(RaportGeneratorData());

  void setRaport(RaportGeneratorData data) {
    state = data;
  }

  void setLocation(RaportLocationData? value) {
    state = state.copyWith(location: value);
  }

  void setProjectManager(String value) {
    state = state.copyWith(projectManager: value);
  }

  void setTradeFair(String value) {
    state = state.copyWith(tradeFair: value);
  }

  void setStartDate(DateTime value) {
    state = state.copyWith(startDate: value);
  }

  void setEndDate(DateTime value) {
    state = state.copyWith(endDate: value);
  }

  void setRopeSuspensionsIntalation(bool value) {
    state = state.copyWith(ropeSuspensionsIntalation: value);
  }

  void setRopeSuspensionsUninstalation(bool value) {
    state = state.copyWith(ropeSuspensionsUninstalation: value);
  }

  void setOtherServices(bool value) {
    state = state.copyWith(otherServices: value);
  }

  void setOtherServicesDescription(String value) {
    state = state.copyWith(otherServicesDescription: value);
  }

  void setHall(String value) {
    state = state.copyWith(hall: value);
  }

  void setStand(String value) {
    state = state.copyWith(stand: value);
  }

  void setExhibitor(String value) {
    state = state.copyWith(exhibitor: value);
  }

  void setCompletionTime(ExactDate value) {
    state = state.copyWith(completionTime: value);
  }

  void setDisassemblyDate(ExactDate value) {
    state = state.copyWith(disassemblyDate: value);
  }

  void setAcceptance(bool value) {
    state = state.copyWith(acceptance: value);
  }

  void setDeffects(String value) {
    state = state.copyWith(deffects: value);
  }

  void setDeffectsSolution(String value) {
    state = state.copyWith(deffectsSolution: value);
  }

  void setDeffectsResolved(bool value) {
    state = state.copyWith(deffectsResolved: value);
  }

  void setSignatureBws(Map<String, dynamic> value) {
    final encoded = jsonEncode(value);
    state = state.copyWith(signatureBws: encoded);
  }

  void setSignatureClient(Map<String, dynamic> value) {
    final encoded = jsonEncode(value);
    state = state.copyWith(signatureClient: encoded);
  }

  void setIsAcceptanceOn(bool value) {
    state = state.copyWith(isAcceptanceOn: value);
  }

  void reset({String defaultManager = ''}) {
    state = RaportGeneratorData();
  }

  bool get generateDisabled {
    return state.location == null ||
        state.projectManager.emptyAsNull() == null ||
        signaturesEmpty;
  }

  bool get signaturesEmpty {
    try {
      final bws = jsonDecode(state.signatureBws);
      final client = jsonDecode(state.signatureClient);
      return bws['paths'].isEmpty == true || client["paths"].isEmpty == true;
    } catch (_) {
      return true;
    }
  }
}
