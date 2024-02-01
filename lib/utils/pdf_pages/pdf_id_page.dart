import 'package:bws_agreement_creator/form.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfIdPage {
  pw.Page generate(FormState form) {
    return pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                if (form.frontIdData != null)
                  pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 32),
                    child: pw.Image(pw.MemoryImage(form.frontIdData!),
                        width: 360, height: 320),
                  ),
                if (form.backIdData != null)
                  pw.Image(pw.MemoryImage(form.backIdData!),
                      width: 360, height: 320),
              ]);
        });
  }
}
