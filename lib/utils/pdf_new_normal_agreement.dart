import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:bws_agreement_creator/Model/new_form_data.dart';
import 'package:bws_agreement_creator/utils/Dictionaries2/normal_agreement_dictionary.dart';
import 'package:bws_agreement_creator/utils/PdfPages/pdf_contractor_statement_page.dart';
import 'package:bws_agreement_creator/utils/PdfPages/pdf_data_processing_page.dart';
import 'package:bws_agreement_creator/utils/PdfPages/pdf_legal_guardian_statement_page.dart';
import 'package:bws_agreement_creator/utils/PdfPages/pdf_signature.dart';
import 'package:bws_agreement_creator/utils/pdf_widget_set.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfNormalAgreementNew {
  pw.Document generateNormalAgreement(NewFormData form) {
    final document = pw.Document();
    final PolishAgreementDictionary dictionary =
        PolishAgreementDictionary(form);

    final page = pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        footer: (context) {
          final pageNumber = context.pageNumber;
          final numberOfPages = context.pagesCount;
          final text = '$pageNumber/$numberOfPages';
          return pw.Row(children: [pw.Spacer(), pw.Text(text)]);
        },
        build: (pw.Context context) {
          return [
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 20),
              child: pw.Center(
                child: pw.Center(
                    child: pw.Text(dictionary.agreementTitle,
                        style: defaultFonts.boldStyle)),
              ),
            ),
            pw.Paragraph(
                text: dictionary.dateOfConclusion,
                style: defaultFonts.regularStyle),
            pw.Paragraph(
                text: dictionary.bwsData, style: defaultFonts.regularStyle),
            pw.Paragraph(
                text: dictionary.contractorData, style: defaultFonts.boldStyle),
            PdfWidgetSet()
                .enumRow(point: "1)", value: dictionary.titlePagePoint1),
            PdfWidgetSet()
                .enumRow(point: "2)", value: dictionary.titlePagePoint2),
            PdfWidgetSet()
                .enumRow(point: "3)", value: dictionary.titlePagePoint3),
            PdfWidgetSet()
                .enumRow(point: "4)", value: dictionary.titlePagePoint4),
            pw.Paragraph(
                text: dictionary.titlePageConclusion,
                style: defaultFonts.regularStyle),
            ...dictionary.contractPurpose.toParagraphWidgetRichText('1'),
            ...dictionary.whistleblowersProtection
                .toParagraphWidgetRichText('1\''),
            ...dictionary.specificContractMaking.toParagraphWidget('2'),
            ...dictionary.rulesOfServiceProviding.toParagraphWidget('3'),
            ...dictionary.periodOfAgreement.toParagraphWidget('4'),
            ...dictionary.salary.toParagraphWidget('5'),
            ...dictionary.studentStatus.toParagraphWidget('6'),
            ...dictionary.confidentiality.toParagraphWidget('7'),
            ...dictionary.penalties.toParagraphWidget('8'),
            ...dictionary.conflictResolving.toParagraphWidget('9'),
            ...dictionary.salvatorianClause.toParagraphWidget('10'),
            ...dictionary.contactData.toParagraphWidgetRichText('11'),
            ...dictionary.finalConclusion.toParagraphWidget('12'),
            SignatureWidgetPdf().generate(
                signatureData: form.signatureData!,
                bwsSignatureData: form.bwsSignatureData!),
          ];
        });
    document.addPage(page);
    document.addPage(PdfDataProcessingPage().generate());

    if (form.legalGuardianIdNumber?.emptyAsNull() != null) {
      document.addPage(PdfLegalGuardianStatementPage().generate(form));
    }

    document.addPage(PdfContractorStatementPage().generate(form));
    return document;
  }
}
