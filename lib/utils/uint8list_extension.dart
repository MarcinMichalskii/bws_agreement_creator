// import 'dart:html' as html;
import 'dart:typed_data';

extension SaveToFiles on Uint8List {
  void saveToFiles(String name) {
    // final blob = html.Blob([this], 'application/pdf');
    // final url = html.Url.createObjectUrlFromBlob(blob);
    // final anchor = html.document.createElement('a') as html.AnchorElement
    //   ..href = url
    //   ..style.display = 'none'
    //   ..download = name
    //   ..click();
    // html.document.body?.children.add(anchor);
  }

  void openInNewTab(String name) {
    // final blob = html.Blob([this], 'application/pdf');
    // final url = html.Url.createObjectUrlFromBlob(blob);
    // final anchor = html.document.createElement('a') as html.AnchorElement
    //   ..href = url
    //   ..target = '_blank'
    //   ..click();
    // html.document.body?.children.add(anchor);
  }
}
