import 'dart:typed_data';

import 'package:bws_agreement_creator/FormUI/Providers/api_controller.dart';
import 'package:bws_agreement_creator/FormUI/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/pdf_b2b_agreement_new.dart';
import 'package:bws_agreement_creator/utils/pdf_new_normal_agreement.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:html' as html;

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
      await _performRequest(
          authString: formData.loginData!.cookie,
          bytes: selectedAgreementData,
          filename: formData.pdfFileName);
      state =
          ParsedResponseState(isLoading: false, data: 'Plik został wysłany');
      _saveToFiles(selectedAgreementData, formData.pdfFileName);
    } catch (e) {
      state = ParsedResponseState(error: CostRegisterError(e.toString()));
      state = ParsedResponseState(isLoading: false);
    }
  }

  _saveToFiles(Uint8List file, String name) async {
    var anchor = null;

    final blob = html.Blob([file], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = name
      ..click();
    html.document.body?.children.add(anchor);
  }

  _performRequest(
      {required String authString,
      required Uint8List bytes,
      required String filename}) async {
    Dio dio = Dio();

    FormData formData = FormData.fromMap({'authString': authString});
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
