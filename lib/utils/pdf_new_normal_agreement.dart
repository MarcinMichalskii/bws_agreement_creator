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
            PdfWidgetSet()
                .styledParagraph(point: "1", value: dictionary.paragraph1Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph1Point1,
            ),
            PdfWidgetSet().enumRowWithRichText(
                point: "2.", value: dictionary.paragraph1Point2),
            PdfWidgetSet()
                .styledParagraph(point: "2", value: dictionary.paragraph2Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph2Point1,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph2Point2,
            ),
            PdfWidgetSet().enumRow(
              point: "3.",
              value: dictionary.paragraph2Point3,
            ),
            PdfWidgetSet().enumRow(
              point: "4.",
              value: dictionary.paragraph2Point4,
            ),
            PdfWidgetSet().enumRow(
              point: "5.",
              value: dictionary.paragraph2Point5,
            ),
            PdfWidgetSet().enumRow(
              point: "6.",
              value: dictionary.paragraph2Point6,
            ),
            PdfWidgetSet().enumRow(
              point: "7.",
              value: dictionary.paragraph2Point7,
            ),
            PdfWidgetSet().enumRow(
              point: "8.",
              value: dictionary.paragraph2Point8,
            ),
            PdfWidgetSet().enumRow(
              point: "9.",
              value: dictionary.paragraph2Point9,
            ),
            PdfWidgetSet()
                .styledParagraph(point: "3", value: dictionary.paragraph3Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph3Point1,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph3Point2,
            ),
            PdfWidgetSet().enumRow(
              point: "3.",
              value: dictionary.paragraph3Point3,
            ),
            PdfWidgetSet().enumRow(
              point: "4.",
              value: dictionary.paragraph3Point4,
            ),
            PdfWidgetSet().enumRow(
              point: "5.",
              value: dictionary.paragraph3Point5,
            ),
            PdfWidgetSet().enumRow(
              point: "6.",
              value: dictionary.paragraph3Point6,
            ),
            PdfWidgetSet().enumRow(
              point: "7.",
              value: dictionary.paragraph3Point7,
            ),
            PdfWidgetSet().enumRow(
              point: "9.",
              value: dictionary.paragraph3Point8,
            ),
            PdfWidgetSet().enumRow(
              point: "9.",
              value: dictionary.paragraph3Point9,
            ),
            PdfWidgetSet().enumRow(
              point: "10.",
              value: dictionary.paragraph3Point10,
            ),
            PdfWidgetSet()
                .styledParagraph(point: "4", value: dictionary.paragraph4Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph4Point1,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph4Point2,
            ),
            PdfWidgetSet().enumRow(
              point: "3.",
              value: dictionary.paragraph4Point3,
            ),
            PdfWidgetSet().enumRow(
              point: "4.",
              value: dictionary.paragraph4Point4,
            ),
            PdfWidgetSet().enumRow(
              point: "5.",
              value: dictionary.paragraph4Point5,
            ),
            PdfWidgetSet()
                .styledParagraph(point: "5", value: dictionary.paragraph5Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph5Point1,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph5Point2,
            ),
            PdfWidgetSet().enumRow(
              point: "3.",
              value: dictionary.paragraph5Point3,
            ),
            PdfWidgetSet().enumRow(
              point: "4.",
              value: dictionary.paragraph5Point4,
            ),
            PdfWidgetSet().enumRow(
              point: "5.",
              value: dictionary.paragraph5Point5,
            ),
            PdfWidgetSet().enumRow(
              point: "6.",
              value: dictionary.paragraph5Point6,
            ),
            PdfWidgetSet().enumRow(
              point: "7.",
              value: dictionary.paragraph5Point7,
            ),
            PdfWidgetSet().enumRow(
              point: "8.",
              value: dictionary.paragraph5Point8,
            ),
            PdfWidgetSet()
                .styledParagraph(point: "6", value: dictionary.paragraph6Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph6Point1,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph6Point2,
            ),
            PdfWidgetSet().enumRow(
              point: "3.",
              value: dictionary.paragraph6Point3,
            ),
            PdfWidgetSet().enumRow(
              point: "4.",
              value: dictionary.paragraph6Point4,
            ),
            PdfWidgetSet().enumRow(
              point: "5.",
              value: dictionary.paragraph6Point5,
            ),
            PdfWidgetSet()
                .styledParagraph(point: "7", value: dictionary.paragraph7Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph7Point1,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph7Point2,
            ),
            PdfWidgetSet().enumRow(
              point: "3.",
              value: dictionary.paragraph7Point3,
            ),
            PdfWidgetSet().enumRow(
              point: "4.",
              value: dictionary.paragraph7Point4,
            ),
            PdfWidgetSet().enumRow(
              point: "5.",
              value: dictionary.paragraph7Point5,
            ),
            PdfWidgetSet().enumRow(
              point: "6.",
              value: dictionary.paragraph7Point6,
            ),
            PdfWidgetSet().enumRow(
              point: "7.",
              value: dictionary.paragraph7Point7,
            ),
            PdfWidgetSet()
                .styledParagraph(point: "8", value: dictionary.paragraph8Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph8Point1,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph8Point2,
            ),
            PdfWidgetSet().enumRow(
              point: "3.",
              value: dictionary.paragraph8Point3,
            ),
            PdfWidgetSet().enumRow(
              point: "4.",
              value: dictionary.paragraph8Point4,
            ),
            PdfWidgetSet().enumRow(
              point: "5.",
              value: dictionary.paragraph8Point5,
            ),
            PdfWidgetSet()
                .styledParagraph(point: "9", value: dictionary.paragraph9Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph9Point1,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph9Point2,
            ),
            PdfWidgetSet().enumRow(
              point: "3.",
              value: dictionary.paragraph9Point3,
            ),
            PdfWidgetSet().enumRow(
              point: "4.",
              value: dictionary.paragraph9Point4,
            ),
            PdfWidgetSet().styledParagraph(
                point: "10", value: dictionary.paragraph10Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph10Point1,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph10Point2,
            ),
            PdfWidgetSet().styledParagraph(
                point: "11", value: dictionary.paragraph11Title),
            PdfWidgetSet().enumRow(
              point: "1.",
              value: dictionary.paragraph11Point1,
              pointTextStyle: defaultFonts.boldStyle,
              valueTextStyle: defaultFonts.boldStyle,
            ),
            PdfWidgetSet().enumRow(
              point: "2.",
              value: dictionary.paragraph11Point2,
            ),
            PdfWidgetSet().enumRow(
              point: "3.",
              value: dictionary.paragraph11Point3,
            ),
            PdfWidgetSet().enumRow(
              point: "4.",
              value: dictionary.paragraph11Point4,
            ),

            ...PolishAgreementDictionary2()
                .finalConclusion
                .toParagraphWidget('12'),
            // PdfWidgetSet().styledParagraph(
            //     point: "12", value: dictionary.paragraph12Title),
            // PdfWidgetSet().enumRow(
            //   point: "1.",
            //   value: dictionary.paragraph12Point1,
            // ),
            // PdfWidgetSet().enumRow(
            //   point: "2.",
            //   value: dictionary.paragraph12Point2,
            // ),
            // PdfWidgetSet().enumRow(
            //   point: "3.",
            //   value: dictionary.paragraph12Point3,
            // ),
            // PdfWidgetSet().enumRow(
            //   point: "4.",
            //   value: dictionary.paragraph12Point4,
            // ),

            // signature should be wrapped with padding

            pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 20),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('BWS', style: defaultFonts.boldStyle),
                      pw.Text(dictionary.serviceProvider,
                          style: defaultFonts.boldStyle),
                    ])),

            pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 20),
                child: pw.Center(
                  child: pw.Center(
                      child: pw.Text(dictionary.dataProcessingInformationTitle,
                          style: defaultFonts.boldStyle,
                          textAlign: pw.TextAlign.center)),
                )),

            pw.Paragraph(
                text: dictionary.dataProcessingInformationDescritpion,
                style: defaultFonts.regularStyle),
            PdfWidgetSet().headeredRow(
              point: dictionary.dataProcessingInformationPoint1Header,
              value: dictionary.dataProcessingInformationPoint1,
            ),
            PdfWidgetSet().headeredRow(
              point: dictionary.dataProcessingInformationPoint2Header,
              value: dictionary.dataProcessingInformationPoint2,
            ),
            PdfWidgetSet().headeredRow(
              point: dictionary.dataProcessingInformationPoint3Header,
              value: dictionary.dataProcessingInformationPoint3,
            ),
            PdfWidgetSet().headeredRow(
              point: dictionary.dataProcessingInformationPoint4Header,
              value: dictionary.dataProcessingInformationPoint4,
            ),
            PdfWidgetSet().headeredRow(
              point: dictionary.dataProcessingInformationPoint5Header,
              value: dictionary.dataProcessingInformationPoint5,
            ),
            PdfWidgetSet().headeredRow(
              point: dictionary.dataProcessingInformationPoint6Header,
              value: dictionary.dataProcessingInformationPoint6,
            ),
            PdfWidgetSet().headeredRow(
              point: dictionary.dataProcessingInformationPoint7Header,
              value: dictionary.dataProcessingInformationPoint7,
            ),
            PdfWidgetSet().headeredRow(
              point: dictionary.dataProcessingInformationPoint8Header,
              value: dictionary.dataProcessingInformationPoint8,
            ),
            PdfWidgetSet().headeredRow(
              point: dictionary.dataProcessingInformationPoint9Header,
              value: dictionary.dataProcessingInformationPoint9,
            ),
          ];
        });
    document.addPage(page);
    return document.save();
  }
}
