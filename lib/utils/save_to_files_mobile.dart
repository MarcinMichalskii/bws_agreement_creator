import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SaveToFilesImpl {
  Future<void> saveToFiles(Uint8List data, String name) async {
    try {
      // Open a directory picker
      await _requestPermission(Permission.manageExternalStorage);
      final directory = await FilePicker.platform.getDirectoryPath();

      if (directory != null) {
        // Create the file in the selected directory
        final file = File('$directory/$name');
        await file.writeAsBytes(data);

        print('File saved to ${file.path}');
      } else {
        print('User canceled directory selection');
      }
    } catch (e) {
      print('Error saving file: $e');
    }
  }

  Future<Directory?> _getSaveDirectory() async {
    // Use different directories based on the platform
    if (Platform.isAndroid) {
      return await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      return await getApplicationDocumentsDirectory();
    } else {
      return null;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.request();
    return status == PermissionStatus.granted;
  }

  void openInNewTab(Uint8List data) {
    // Mobile-specific implementation or leave empty as this might not make sense on mobile
  }
}
