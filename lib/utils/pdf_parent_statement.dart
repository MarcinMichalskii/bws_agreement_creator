import 'package:bws_agreement_creator/form.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfParentStatment {
  Future<pw.Page> generatePdfPage(FormState form) async {
    final bold10 = await boldTextStyle(10);
    final bold12 = await boldTextStyle(12);
    final regular10 = await regulartTextStyle(10);
    final regular12 = await regulartTextStyle(12);
    final regular12underline = await regulartTextStyle(12, underline: true);

    return pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Text(
                        '${form.placeOfDomicile.city}, dnia: ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                        style: regular12underline)
                  ],
                ),
                pw.Text('Imię i nazwisko: ${form.parentName}',
                    style: regular10),
                pw.Text('Adres zamieszkania: ${form.parentAdres}',
                    style: regular10),
                pw.Text('PESEL: ${form.parentPesel}', style: regular10),
                pw.Text('Rodzaj i numer dokumentu tożsamości: ${form.parentId}',
                    style: regular10),
                pw.Container(
                  alignment: pw.Alignment.center,
                  margin: const pw.EdgeInsets.fromLTRB(32, 24, 32, 8),
                  child: pw.Text(
                      'Zgoda przedstawiciela ustawowego dziecka na wykonywanie przez dziecko pracy lub innych zajęć zarobkowych',
                      style: bold12),
                ),
                pw.Text('Będąc przedstawicielem ustawowym małoletniego',
                    style: regular10),
                pw.Text('Imię i nazwisko: ${form.name} ${form.lastName}',
                    style: regular10),
                pw.Text(
                    'Adres: ${form.placeOfDomicile.city}, ${form.placeOfDomicile.street} ${form.placeOfDomicile.houseNumber} / ${form.placeOfDomicile.flatNumber}',
                    style: regular10),
                pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 4),
                    child: pw.Text('Pesel: ${form.pesel}', style: regular10)),
                pw.Text(
                    '\nwyrażam zgodę na wykonywanie przez niego na podstawie umowy cywilnoprawnej usług\npolegających na: montażach, obsłudze i demontażach\nscenotechniki, przeładunku ciężarówek, pracach pomocniczych w magazynach i na\neventach; świadczonych na rzecz',
                    style: regular10),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 4),
                    child: pw.Text(
                        'BWS Event Support Sp. z o.o.\nNIP 6751759898\nKRS 0000944605\nul. Na Szaniec 7, 31-559 Kraków',
                        style: bold10)),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 4),
                    child: pw.Text(
                        'Okres możliwości wykonywania usług określony został w umowie podpisanej z usługobiorcą.',
                        style: regular10)),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 4),
                    child: pw.Text(
                        '..................................... \n     Podpis',
                        style: regular12))
              ]);
        });
  }

  Future<pw.TextStyle> boldTextStyle(double size) async {
    final font = await PdfGoogleFonts.openSansBold();
    return pw.TextStyle(
        fontBold: font, fontSize: size, fontWeight: pw.FontWeight.bold);
  }

  Future<pw.TextStyle> regulartTextStyle(double size,
      {bool underline = false}) async {
    final font = await PdfGoogleFonts.openSansRegular();
    return pw.TextStyle(
        font: font,
        fontSize: size,
        decoration:
            underline ? pw.TextDecoration.underline : pw.TextDecoration.none);
  }
}
