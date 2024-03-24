import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

DefaultFonts defaultFonts = DefaultFonts();

class DefaultFonts {
  Font bold = Font.timesBold();
  Font regular = Font.times();

  Future<void> loadFonts() async {
    final boldFont = await PdfGoogleFonts.openSansBold();
    final regularFont = await PdfGoogleFonts.openSansRegular();
    defaultFonts.bold = boldFont;
    defaultFonts.regular = regularFont;
  }

  pw.TextStyle get boldStyle => pw.TextStyle(font: bold, fontSize: 11);
  pw.TextStyle get regularStyle =>
      pw.TextStyle(font: regular, fontSize: 11, lineSpacing: 1.5);
}
