import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:bws_agreement_creator/utils/dictionaries/data_processing_dictionary.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfDataProcessingPage {
  pw.MultiPage generate() {
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
