import 'package:bws_agreement_creator/form.dart';
import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPermission {
  Future<Uint8List> generatePdfPage(FormState form) async {
    final document = pw.Document();

    final page = pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                if (form.permissionData != null)
                  pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 32),
                    child: pw.Image(pw.MemoryImage(form.permissionData!),
                        width: 360, height: 320),
                  ),
              ]);
        });
    document.addPage(page);
    return document.save();
  }

  Future<pw.TextStyle> boldTextStyle(double size) async {
    final font = await PdfGoogleFonts.openSansBold();
    return pw.TextStyle(
        fontBold: font, fontSize: size, fontWeight: pw.FontWeight.bold);
  }

  Future<pw.TextStyle> regulartTextStyle(double size,
      {bool underline = false}) async {
    final font = await PdfGoogleFonts.openSansRegular();
    return pw.TextStyle(
        font: font,
        fontSize: size,
        decoration:
            underline ? pw.TextDecoration.underline : pw.TextDecoration.none);
  }
}
