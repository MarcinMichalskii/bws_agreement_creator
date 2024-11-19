import 'dart:typed_data';
import 'save_to_files_web.dart'
    if (dart.library.html) 'save_to_files_web.dart'
    if (dart.library.io) 'save_to_files_mobile.dart';

extension SaveToFiles on Uint8List {
  void saveToFiles(String name) {
    SaveToFilesImpl().saveToFiles(this, name);
  }

  void openInNewTab() {
    SaveToFilesImpl().openInNewTab(this);
  }
}
