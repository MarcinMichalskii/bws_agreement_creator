import 'package:bws_agreement_creator/Fonts.dart';
import 'package:bws_agreement_creator/Model/new_form_data.dart';
import 'package:bws_agreement_creator/utils/dictionaries/b2b_agreement_dictionary.dart';
import 'package:bws_agreement_creator/utils/dictionaries/normal_agreement_dictionary.dart';
import 'package:bws_agreement_creator/utils/pdf_pages/pdf_data_processing_page.dart';
import 'package:bws_agreement_creator/utils/pdf_pages/pdf_signature.dart';
import 'package:bws_agreement_creator/utils/pdf_widget_set.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfB2BAgreementNew {
  Future<Uint8List> generateB2bPdf(NewFormData form) async {
    final document = pw.Document();
    final PolishAgreementDictionary dictionary =
        PolishAgreementDictionary(form);
    final PolishB2BAgreementDictionary b2bDictionary =
        PolishB2BAgreementDictionary(form);

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
                text: b2bDictionary.bwsData, style: defaultFonts.regularStyle),
            pw.Paragraph(
                text: b2bDictionary.contractorData,
                style: defaultFonts.boldStyle),
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
            ...dictionary.specificContractMaking.toParagraphWidget('2'),
            ...b2bDictionary.rulesOfServiceProviding.toParagraphWidget('3'),
            ...dictionary.periodOfAgreement.toParagraphWidget('4'),
            ...b2bDictionary.salary.toParagraphWidget('5'),
            ...dictionary.conflictResolving.toParagraphWidget('6'),
            ...dictionary.confidentiality.toParagraphWidget('7'),
            ...b2bDictionary.penalties.toParagraphWidget('8'),
            ...dictionary.salvatorianClause.toParagraphWidget('9'),
            ...dictionary.contactData.toParagraphWidget('10'),
            ...dictionary.finalConclusion.toParagraphWidget('11'),
            SignatureWidgetPdf().generate(
                signatureData: form.signatureData!,
                bwsSignatureData: form.bwsSignatureData!),
          ];
        });
    document.addPage(page);
    document.addPage(PdfDataProcessingPage().generate());
    return document.save();
  }
}
