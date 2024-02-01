import 'package:bws_agreement_creator/Fonts.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/normal_agreement_dictionary.dart';
import 'package:bws_agreement_creator/utils/pdf_widget_set.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfNormalAgreementNew {
  Future<Uint8List> generateAgreementFirstPage(FormState form) async {
    final document = pw.Document();
    final PolishAgreementDictionary dictionary =
        PolishAgreementDictionary(form);
    final dictionary2 = PolishAgreementDictionary2(form);

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
            ...dictionary2.contractPurpose.toParagraphWidgetRichText('1'),
            ...dictionary2.specificContractMaking.toParagraphWidget('2'),
            ...dictionary2.rulesOfServiceProviding.toParagraphWidget('3'),
            ...dictionary2.periodOfAgreement.toParagraphWidget('4'),
            ...dictionary2.salary.toParagraphWidget('5'),
            ...dictionary2.studentStatus.toParagraphWidget('6'),
            ...dictionary2.confidentiality.toParagraphWidget('7'),
            ...dictionary2.penalties.toParagraphWidget('8'),
            ...dictionary2.conflictResolving.toParagraphWidget('9'),
            ...dictionary2.salvatorianClause.toParagraphWidget('10'),
            ...dictionary2.contactData.toParagraphWidgetRichText('11'),
            ...dictionary2.finalConclusion.toParagraphWidget('12'),
            pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 20),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('BWS', style: defaultFonts.boldStyle),
                      pw.Text(dictionary.serviceProvider,
                          style: defaultFonts.boldStyle),
                    ])),
          ];
        });
    document.addPage(page);
    document.addPage(generateDataProcessingPage());
    return document.save();
  }

  pw.MultiPage generateDataProcessingPage() {
    final dataProcessingDictionary = DataProcessingPolishDictionary();
    return pw.MultiPage(build: (context) {
      return [
        pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 20),
            child: pw.Center(
              child: pw.Center(
                  child: pw.Text(
                      dataProcessingDictionary.dataProcessingInformationTitle,
                      style: defaultFonts.boldStyle,
                      textAlign: pw.TextAlign.center)),
            )),
        pw.Paragraph(
            text: dataProcessingDictionary.dataProcessingInformationDescritpion,
            style: defaultFonts.regularStyle),
        ...dataProcessingDictionary.points.map((e) => e.toHedearedRow())
      ];
    });
  }
}
