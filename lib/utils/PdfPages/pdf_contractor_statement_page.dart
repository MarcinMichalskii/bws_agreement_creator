import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:bws_agreement_creator/Model/new_form_data.dart';
import 'package:bws_agreement_creator/utils/Dictionaries/contractor_statement_dictionary.dart';
import 'package:bws_agreement_creator/utils/PdfPages/pdf_signature.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfContractorStatementPage {
  pw.Page generate(NewFormData form) {
    ContractorStatementDictionary dictionary =
        ContractorStatementDictionary(form);
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
                    text: dictionary.contractorData,
                    textAlign: pw.TextAlign.left,
                    style: defaultFonts.regularStyle),
                pw.Paragraph(
                    text: dictionary.statement,
                    textAlign: pw.TextAlign.left,
                    style: defaultFonts.regularStyle),
                pw.Paragraph(
                    text: dictionary.workInOtherCompany,
                    textAlign: pw.TextAlign.left,
                    style: defaultFonts.regularStyle),
                if (form.worksInOtherCompany)
                  pw.Paragraph(
                      text: dictionary.otherCompanyDescription,
                      textAlign: pw.TextAlign.left,
                      style: defaultFonts.regularStyle),
                pw.Paragraph(
                    text: dictionary.hasOwnCompany,
                    textAlign: pw.TextAlign.left,
                    style: defaultFonts.regularStyle),
                pw.Paragraph(
                    text: form.isStudent
                        ? dictionary.hasStudentStatus
                        : dictionary.doesntHaveStudentStatus,
                    textAlign: pw.TextAlign.left,
                    style: defaultFonts.regularStyle),
                SignatureWidgetPdf().generate(
                    signatureData: form.signatureData!,
                    bwsSignatureData: form.bwsSignatureData!),
              ]);
        });
  }
}
