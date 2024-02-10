import 'dart:typed_data';

import 'package:bws_agreement_creator/FormUI/Providers/api_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uploadPdfProvider =
    StateNotifierProvider<UploadPdfNotifier, ParsedResponseState<void>>((ref) {
  return UploadPdfNotifier();
});

class UploadPdfNotifier extends StateNotifier<ParsedResponseState<void>> {
  UploadPdfNotifier() : super(ParsedResponseState());

  void uploadPdf(
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
