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

extension InsertPageNumbers on PdfDocument {
  insertPageNumbers() {
    for (int i = 0; i < pages.count; i++) {
      final page = pages[i];
      page.graphics.drawString(
          "Strona ${i + 1}/${pages.count}",
          PdfStandardFont(PdfFontFamily.helvetica, 9,
              style: PdfFontStyle.regular),
          bounds: Rect.fromLTWH(page.size.width - 140, 740, 60, 20));
    }
  }
}

extension CopyAllPages on PdfDocument {
  copyAllPages(PdfDocument fromPdf) {
    for (int i = 0; i < fromPdf.pages.count; i++) {
      pages.add();
      final emptyPage = pages[i];
      emptyPage.graphics.drawPdfTemplate(
          fromPdf.pages[i].createTemplate(), const Offset(-40, 0));
    }
  }
}
