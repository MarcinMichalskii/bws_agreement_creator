import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:pdf/widgets.dart' as pw;

class CheckmarkTableRowWidget {
  final bool isChecked;
  final String title;
  final String subtitle;
  final bool rowsReversed;
  final double checkmarkSize;

  CheckmarkTableRowWidget({
    required this.isChecked,
    required this.title,
    this.subtitle = '',
    this.rowsReversed = false,
    this.checkmarkSize = 16,
  });

  pw.TableRow tableRow() {
    final checkmark = pw.Image(pdfImages.checkmark,
        fit: pw.BoxFit.contain, width: checkmarkSize, height: checkmarkSize);
    final crossmark = pw.Image(pdfImages.crossmark,
        fit: pw.BoxFit.contain, width: checkmarkSize, height: checkmarkSize);
    final children = [
      pw.Padding(
        padding: const pw.EdgeInsets.all(4.0),
        child: pw.Center(
            child: pw.Container(
                margin: pw.EdgeInsets.only(top: 4),
                child: isChecked ? checkmark : crossmark)),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              title,
              style: defaultFonts.boldStyle,
            ),
            if (subtitle.isNotEmpty) ...[
              pw.SizedBox(height: 2),
              pw.Text(
                subtitle,
                style: defaultFonts.regularStyle,
              ),
            ],
          ],
        ),
      ),
    ];
    return pw.TableRow(
      children: rowsReversed ? children.reversed.toList() : children,
    );
  }
}
