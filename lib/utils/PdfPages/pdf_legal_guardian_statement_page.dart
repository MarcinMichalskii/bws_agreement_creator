import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:bws_agreement_creator/Model/new_form_data.dart';
import 'package:bws_agreement_creator/utils/Dictionaries2/legal_guardian_consent_dictionary.dart';
import 'package:bws_agreement_creator/utils/PdfPages/pdf_signature.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfLegalGuardianStatementPage {
  pw.Page generate(NewFormData form) {
    LegalGuardianConsentDictionary dictionary =
        LegalGuardianConsentDictionary(form);
    return pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                  pw.Paragraph(
                      text: dictionary.dateOfConclusion,
                      textAlign: pw.TextAlign.right,
                      style: defaultFonts.regularStyle),
                ]),
                pw.Paragraph(
                    text: dictionary.guardianData,
                    textAlign: pw.TextAlign.left,
                    style: defaultFonts.regularStyle),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Paragraph(
                          text: dictionary.title,
                          style: defaultFonts.boldStyle,
                          textAlign: pw.TextAlign.center),
                    ]),
                pw.Paragraph(
                    text: dictionary.childData,
                    textAlign: pw.TextAlign.left,
                    style: defaultFonts.regularStyle),
                pw.Paragraph(
                    text: dictionary.guardianConsent,
                    textAlign: pw.TextAlign.left,
                    style: defaultFonts.regularStyle),
                pw.Paragraph(
                    text: dictionary.bwsData,
                    style: defaultFonts.boldStyle,
                    textAlign: pw.TextAlign.left),
                pw.Paragraph(
                    text: dictionary.period,
                    textAlign: pw.TextAlign.left,
                    style: defaultFonts.regularStyle),
                SignatureWidgetPdf().generate(
                    signatureData: form.legalGuardianSignatureData!,
                    bwsSignatureData: form.bwsSignatureData!),
              ]);
        });
  }
}
