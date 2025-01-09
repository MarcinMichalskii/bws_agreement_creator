import 'dart:typed_data';

import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/multipart_file_creator.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final updatePermanentResidencePhotosProvider = StateNotifierProvider<
    UpdatePermanentResidencePhotoNotifier, APIResponseState<String?>>((ref) {
  return UpdatePermanentResidencePhotoNotifier(ref);
});

class UpdatePermanentResidencePhotoNotifier
    extends StateNotifier<APIResponseState<String?>> {
  final StateNotifierProviderRef<UpdatePermanentResidencePhotoNotifier,
      APIResponseState<String?>> ref;

  UpdatePermanentResidencePhotoNotifier(this.ref) : super(APIResponseState());

  Future<void> update(DateTime expirationDate, Uint8List frontPhoto,
      Uint8List backPhoto) async {
    state = APIResponseState(isLoading: true);

    try {
      final formattedDate = DateFormat('dd.MM.yyyy').format(expirationDate);

      final formData = FormData.fromMap({
        "expirationDate": formattedDate,
        "frontPhoto": await MultipartFileCreator.createMultipartFile(
            frontPhoto, "front_photo"),
        "backPhoto": await MultipartFileCreator.createMultipartFile(
            backPhoto, "back_photo"),
      });

      final accessToken =
          ref.read(authProvider.notifier).state.data?.accessToken ?? '';

      state = await _performRequest(accessToken: accessToken, data: formData);
    } catch (e) {
      state = APIResponseState(
        error: CostRegisterError("Failed to upload photos $e"),
      );
    }
  }

  Future<APIResponseState<String>> _performRequest(
      {required String accessToken, required Object data}) async {
    dio.options.headers['authorization'] = 'Bearer $accessToken';

    Response response = await dio.post(
      '$baseUrl/uploadPermanentResidencePhoto',
      data: data,
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
