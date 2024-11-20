import 'dart:html' as html;
import 'dart:typed_data';

class SaveToFilesImpl {
  void saveToFiles(Uint8List data, String name) {
    final blob = html.Blob([data], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = name
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  void openInNewTab(Uint8List data) {
    final blob = html.Blob([data], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..target = '_blank'
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}
