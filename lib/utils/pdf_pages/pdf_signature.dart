import 'dart:typed_data';

import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:pdf/widgets.dart' as pw;

class SignatureWidgetPdf {
  pw.Widget generate(
      {required Uint8List signatureData, required Uint8List bwsSignatureData}) {
    return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                    width: 0.5,
                  )),
                  child: pw.Image(pw.MemoryImage(signatureData),
                      width: 180, height: 120),
                ),
                pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 4),
                    child: pw.Text('Podpis', style: defaultFonts.boldStyle))
              ]),
          pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Container(
                  decoration:
                      pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
                  child: pw.Image(pw.MemoryImage(bwsSignatureData),
                      width: 180, height: 120),
                ),
                pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 4),
                    child: pw.Text('BWS', style: defaultFonts.boldStyle))
              ])
        ]);
  }
}
