import 'dart:typed_data';

import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Pdf/raport_generator_dictionary.dart';
import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:bws_agreement_creator/utils/PdfPages/pdf_signature.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

class RaportSignaturePdfWidget {
  pw.Widget generate({
    required Uint8List signatureData,
    required Uint8List bwsSignatureData,
  }) {
    final dictionary = RaportGeneratorDictionary();
    final currentDate = DateTime.now().toReadableDate();
    return pw.Container(
        margin: pw.EdgeInsets.only(top: 8),
        child: pw.Column(children: [
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(width: 180),
                      pw.Padding(
                          padding: const pw.EdgeInsets.only(top: 4),
                          child: pw.Text('${dictionary.date} $currentDate',
                              style: defaultFonts.boldStyle)),
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(width: 180),
                      pw.Padding(
                          padding: const pw.EdgeInsets.only(top: 4),
                          child: pw.Text('${dictionary.date} $currentDate',
                              style: defaultFonts.boldStyle)),
                    ]),
              ]),
          SignatureWidgetPdf().generate(
              signatureData: signatureData,
              bwsSignatureData: bwsSignatureData,
              title: dictionary.signature),
        ]));
  }
}
