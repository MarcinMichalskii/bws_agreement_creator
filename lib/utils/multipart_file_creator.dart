import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

class MultipartFileCreator {
  static Future<MultipartFile> createMultipartFile(
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
}
