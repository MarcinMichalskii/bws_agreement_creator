import 'dart:typed_data';

import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/pdf_b2b_agreement_new.dart';
import 'package:bws_agreement_creator/utils/pdf_new_normal_agreement.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final agreementProvider = StateProvider<Uint8List?>((ref) {
  return null;
});

final uploadPdfProvider =
    StateNotifierProvider<UploadPdfNotifier, ParsedResponseState<String?>>(
        (ref) {
  return UploadPdfNotifier(ref);
});

class UploadPdfNotifier extends StateNotifier<ParsedResponseState<String?>> {
  StateNotifierProviderRef<UploadPdfNotifier, ParsedResponseState<String?>> ref;
  UploadPdfNotifier(this.ref) : super(ParsedResponseState());

  void uploadPdf() async {
    try {
      state = ParsedResponseState(isLoading: true);
      final formData = ref.read(newFormDataProvider.notifier).state;
      final pdf = PdfNormalAgreementNew().generateNormalAgreement(formData);
      final pdfB2b = PdfB2BAgreementNew().generateB2bPdf(formData);

      final selectedAgreement =
          formData.b2bCompanyName?.emptyAsNull() != null ? pdfB2b : pdf;
      final selectedAgreementData = await selectedAgreement.save();

      state = ParsedResponseState(isLoading: true);
      final accessToken =
          ref.read(authProvider.notifier).state.data?.accessToken ?? '';
      await _performRequest(
          accessToken: accessToken,
          bytes: selectedAgreementData,
          filename: formData.pdfFileName);
      state =
          ParsedResponseState(isLoading: false, data: 'Plik został wysłany');
      ref.read(agreementProvider.notifier).state = selectedAgreementData;
      ref.read(appStateProvider.notifier).setSentAgreement(true);
    } catch (e) {
      state = ParsedResponseState(error: CostRegisterError(e.toString()));
      state = ParsedResponseState(isLoading: false);
    }
  }

  _performRequest(
      {required String accessToken,
      required Uint8List bytes,
      required String filename}) async {
    Dio dio = Dio();

    dio.options.headers['authorization'] = 'Bearer $accessToken';
    FormData formData = FormData();
    final file = MultipartFile.fromBytes(bytes, filename: filename);
    final mapEntry = MapEntry('pdfFile', file);
    formData.files.add(mapEntry);

    Response response = await dio.post(
      '$baseUrl/upload',
      data: formData,
    );

    print('Response: ${response.data}');
  }
}
