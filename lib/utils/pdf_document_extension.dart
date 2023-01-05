import 'dart:html' as html;
import 'package:bws_agreement_creator/utils/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

extension InsertCustomPage on PdfDocument {
  insertCustomPage(PdfPage customPage, int index) {
    pages.insert(index);
    final emptyPage = pages[index];
    emptyPage.graphics
        .drawPdfTemplate(customPage.createTemplate(), const Offset(-40, 0));
  }
}

extension SavePdfFile on PdfDocument {
  saveToFiles() async {
    var anchor = null;
    final data = await save();
    final blob = html.Blob([data.asUint8List()], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'umowa.pdf'
      ..click();
    html.document.body?.children.add(anchor);
  }
}
