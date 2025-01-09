import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

Future<String> savePdfAsFile(Uint8List pdfData, String fileName) async {
  final directory = await getTemporaryDirectory(); // Temporary storage
  final filePath = '${directory.path}/$fileName';
  final file = File(filePath);
  await file.writeAsBytes(pdfData);
  return filePath;
}

class PDFPreviewPage extends StatelessWidget {
  final String filePath;

  PDFPreviewPage({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PDF Preview')),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
