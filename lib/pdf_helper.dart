import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/foundation.dart';
import 'package:printing/printing.dart';

class GeneratePdfHelper {
  Future<Uint8List> generatePdf(
      String name, String lastName, String city, String brirthday) async {
    final document = pw.Document();
    final font = await PdfGoogleFonts.openSansRegular();

    document.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Imię: $name', style: pw.TextStyle(font: font)),
                pw.Text('Nazwisko: $lastName', style: pw.TextStyle(font: font)),
                pw.Text('Miasto: $city', style: pw.TextStyle(font: font)),
                pw.Text('Data urodzenia: $brirthday',
                    style: pw.TextStyle(font: font)),
              ]);
        }));
    return document.save();
  }
}
