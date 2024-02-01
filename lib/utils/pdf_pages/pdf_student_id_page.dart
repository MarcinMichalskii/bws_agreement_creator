import 'package:bws_agreement_creator/form.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfStudentIdPage {
  pw.Page generate(FormState form) {
    return pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                if (form.frontStudentIdData != null)
                  pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 32),
                    child: pw.Image(pw.MemoryImage(form.frontStudentIdData!),
                        width: 360, height: 320),
                  ),
                if (form.backStudentIdData != null)
                  pw.Image(pw.MemoryImage(form.backStudentIdData!),
                      width: 360, height: 320),
              ]);
        });
  }
}
