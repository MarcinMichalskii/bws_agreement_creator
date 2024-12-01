import 'dart:typed_data';

import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

final updateStudentIdPhotosProvider = StateNotifierProvider<
    UpdateStudentIdPhotoNotifier, APIResponseState<String?>>((ref) {
  return UpdateStudentIdPhotoNotifier(ref);
});

class UpdateStudentIdPhotoNotifier
    extends StateNotifier<APIResponseState<String?>> {
  final StateNotifierProviderRef<UpdateStudentIdPhotoNotifier,
      APIResponseState<String?>> ref;

  UpdateStudentIdPhotoNotifier(this.ref) : super(APIResponseState());

  Future<void> updateStudentIdPhotos(DateTime expirationDate,
      Uint8List frontPhoto, Uint8List backPhoto) async {
    state = APIResponseState(isLoading: true);

    try {
      final formattedDate = DateFormat('dd.MM.yyyy').format(expirationDate);

      final formData = FormData.fromMap({
        "expirationDate": formattedDate,
        "frontPhoto": await _createMultipartFile(frontPhoto, "front_photo"),
        "backPhoto": await _createMultipartFile(backPhoto, "back_photo"),
      });

      final accessToken =
          ref.read(authProvider.notifier).state.data?.accessToken ?? '';

      state = await _performRequest(accessToken: accessToken, data: formData);
    } catch (e) {
      state = APIResponseState(
        error: CostRegisterError("Failed to upload student ID photos: $e"),
      );
    }
  }

  Future<MultipartFile> _createMultipartFile(
      Uint8List fileBytes, String name) async {
    final mimeType = lookupMimeType('', headerBytes: fileBytes) ??
        'application/octet-stream';
    final fileExtension = mimeType.split('/').last;

    return MultipartFile.fromBytes(
      fileBytes,
      filename: "$name.$fileExtension",
      contentType: DioMediaType(mimeType.split('/')[0], mimeType.split('/')[1]),
    );
  }

  Future<APIResponseState<String>> _performRequest(
      {required String accessToken, required Object data}) async {
    dio.options.headers['authorization'] = 'Bearer $accessToken';

    Response response = await dio.post(
      '$baseUrl/uploadStudentIdPhotos',
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
