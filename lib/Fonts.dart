import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

DefaultFonts defaultFonts = DefaultFonts();

class DefaultFonts {
  Font bold = Font.timesBold();
  Font regular = Font.times();

  pw.TextStyle get boldStyle => pw.TextStyle(font: bold, fontSize: 11);
  pw.TextStyle get regularStyle =>
      pw.TextStyle(font: regular, fontSize: 11, lineSpacing: 1.5);
}
