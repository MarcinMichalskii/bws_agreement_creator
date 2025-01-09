import 'dart:typed_data';

import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/multipart_file_creator.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uploadRaportProvider =
    StateNotifierProvider<UploadRaportNotifier, APIResponseState<String?>>(
        (ref) {
  return UploadRaportNotifier(ref);
});

class UploadRaportNotifier extends StateNotifier<APIResponseState<String?>> {
  Ref<APIResponseState<String?>> ref;
  UploadRaportNotifier(this.ref) : super(APIResponseState());

  void uploadPdf(Uint8List raport, String clientName, DateTime date) async {
    try {
      state = APIResponseState(isLoading: true);

      final accessToken =
          ref.read(authProvider.notifier).state.data?.accessToken ?? '';
      await _performRequest(
          accessToken: accessToken,
          date: DateFormat('dd.MM.yyyy').format(date),
          bytes: raport,
          name: clientName);
      state = APIResponseState(isLoading: false, data: 'Plik został wysłany');
    } catch (e) {
      state = APIResponseState(error: CostRegisterError(e.toString()));
      state = APIResponseState(isLoading: false);
    }
  }

  _performRequest(
      {required String accessToken,
      required Uint8List bytes,
      required String date,
      required String name}) async {
    dio.options.headers['authorization'] = 'Bearer $accessToken';

    final formData = FormData.fromMap({
      "date": date,
      "name": name,
      "file": await MultipartFileCreator.createMultipartFile(bytes, "file"),
    });

    Response response = await dio.post(
      '$baseUrl/uploadRaport',
      data: formData,
    );

    if (response.statusCode != 200) {
      return APIResponseState(
        error: CostRegisterError.fromJson(response.data),
      );
    } else {
      return APIResponseState(data: "Sukces");
    }
  }
}
