import 'package:pdf/widgets.dart' as pw;

class HeaderTextPdfWidget {
  pw.Text generate({required String title}) {
    return pw.Text(
      "Auftrag / Order",
      style: pw.TextStyle(
        fontSize: 20,
        fontWeight: pw.FontWeight.bold,
      ),
    );
  }
}
