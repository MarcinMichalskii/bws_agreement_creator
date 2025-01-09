import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:pdf/widgets.dart' as pw;

class DefaultTableRowWidget {
  final String title;
  final String value;

  DefaultTableRowWidget({required this.title, required this.value});

  pw.TableRow tableRow() {
    return pw.TableRow(
      children: [
        pw.Padding(
          padding: pw.EdgeInsets.all(5),
          child: pw.Text(title, style: defaultFonts.regularStyle),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.all(5),
          child: pw.Text(value, style: defaultFonts.regularStyle),
        ),
      ],
    );
  }
}
