import 'dart:isolate';
import 'dart:typed_data';

import 'package:bws_agreement_creator/FormUI/Providers/api_controller.dart';
import 'package:bws_agreement_creator/FormUI/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/utils/pdf_b2b_agreement_new.dart';
import 'package:bws_agreement_creator/utils/pdf_new_normal_agreement.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:html' as html;

final uploadPdfProvider =
    StateNotifierProvider<UploadPdfNotifier, ParsedResponseState<void>>((ref) {
  return UploadPdfNotifier(ref);
});

class UploadPdfNotifier extends StateNotifier<ParsedResponseState<void>> {
  StateNotifierProviderRef<UploadPdfNotifier, ParsedResponseState<void>> ref;
  UploadPdfNotifier(this.ref) : super(ParsedResponseState());

  void uploadPdf() async {
    try {
      state = ParsedResponseState(isLoading: true);
      final formData = ref.read(newFormDataProvider.notifier).state;
      final selectedAgreement = await generatePdf(formData);

      state = ParsedResponseState(isLoading: true);
      await _performRequest(
          authString: formData.loginData!.cookie,
          bytes: selectedAgreement,
          filename: formData.pdfFileName);
      state = ParsedResponseState(isLoading: false);
    } catch (e) {
      state = ParsedResponseState(error: CostRegisterError(e.toString()));
      state = ParsedResponseState(isLoading: false);
    }
  }

  Future<Uint8List> generatePdf(formData) async {
    if (html.Worker.supported) {
      var myWorker = html.Worker("ww.dart.js");
      myWorker.onMessage.listen((event) {
        print("main:receive: ${event.data}");
      });
      myWorker.postMessage("Hello!!");
    } else {
      print('Your browser doesn\'t support web workers.');
    }
    final Uint8List pdf = await Isolate.run<Uint8List>(() {
      final pdf = PdfNormalAgreementNew().generateNormalAgreement(formData);
      final pdfB2b = PdfB2BAgreementNew().generateB2bPdf(formData);

      return formData.b2bCompanyName?.emptyAsNull() != null ? pdfB2b : pdf;
    });
    return pdf;
  }

  _performRequest(
      {required String authString,
      required Uint8List bytes,
      required String filename}) async {
    try {
      Dio dio = Dio();

      FormData formData = FormData.fromMap({'authString': authString});
      final file = MultipartFile.fromBytes(bytes, filename: filename);
      final mapEntry = MapEntry('pdfFile', file);
      formData.files.add(mapEntry);

      Response response = await dio.post(
        'http://localhost:3000/upload',
        data: formData,
      );

      print('Response: ${response.data}');
    } catch (e) {
      print('Error: $e');
      // Handle the error as needed
    }
  }
}
