import 'package:bws_agreement_creator/form.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfNormalAgreement {
  Future<Uint8List> generateAgreementFirstPage(FormState form) async {
    final document = pw.Document();
    final birthday = DateFormat('dd.MM.yyyy').format(form.birthday);
    final bold8 = await boldTextStyle(8);
    final bold10 = await boldTextStyle(10);
    final bold14 = await boldTextStyle(14);
    final regular8 = await regulartTextStyle(8);
    final regular11 = await regulartTextStyle(11);
    final regular12 = await regulartTextStyle(12);
    final regular12underline = await regulartTextStyle(12, underline: true);

    final page = pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                    child: pw.Text('Umowa Ramowa o Świadczenie usług',
                        style: bold10)),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 8),
                  child: pw.Text(
                      'zawarta w dniu ${DateFormat('dd.MM.yyyy').format(DateTime.now())} w Krakowie',
                      textAlign: pw.TextAlign.left,
                      style: regular11),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 4),
                  child:
                      pw.Text(NormalAgreementTexts.bwsData, style: regular11),
                ),
                pw.Text(
                    '${form.name} ${form.lastName}\n${form.pesel}\n${form.placeOfDomicile.city}, ${form.placeOfDomicile.street} ${form.placeOfDomicile.houseNumber}, ${form.placeOfDomicile.flatNumber}',
                    style: bold10),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 8),
                  child: pw.Text(NormalAgreementTexts.howDataWasVerified,
                      style: regular11),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 8),
                  child: pw.Text(NormalAgreementTexts.howSidesAreCalled,
                      style: regular11),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 8),
                  child: pw.Text('Zważywszy że: ', style: regular11),
                ),
                pw.Container(
                  margin: pw.EdgeInsets.only(left: 16),
                  child: pw.Column(children: [
                    enumRow(
                        point: '1)',
                        value: NormalAgreementTexts.firstPageFirstPoint,
                        pointTextStyle: regular11,
                        valueTextStyle: regular11),
                    enumRow(
                        point: '2)',
                        value: NormalAgreementTexts.firstPageSecondPoint,
                        pointTextStyle: regular11,
                        valueTextStyle: regular11),
                    enumRow(
                        point: '3)',
                        value: NormalAgreementTexts.firstPageThirdPoint,
                        pointTextStyle: regular11,
                        valueTextStyle: regular11),
                    enumRow(
                        point: '4)',
                        value: NormalAgreementTexts.firstPageFourthPoint,
                        pointTextStyle: regular11,
                        valueTextStyle: regular11),
                  ]),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 16),
                  child: pw.Text('Strony postanawiają, co następuje: ',
                      style: regular11),
                ),
              ]);
        });
    document.addPage(page);
    return document.save();
  }

  Future<Uint8List> generateStudentStatusPage(FormState form) async {
    final document = pw.Document();
    final birthday = DateFormat('dd.MM.yyyy').format(form.birthday);
    final bold8 = await boldTextStyle(8);
    final bold10 = await boldTextStyle(10);
    final bold14 = await boldTextStyle(14);
    final regular8 = await regulartTextStyle(8);
    final regular11 = await regulartTextStyle(11);
    final regular12 = await regulartTextStyle(12);
    final regular12underline = await regulartTextStyle(12, underline: true);

    final page = pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            enumRow(
                point: '',
                value:
                    'dokonywania zwrotu kosztów używania do celów służbowych samochodów osobowych, motocykli i motorowerów niebędących własnością pracodawcy.',
                pointTextStyle: regular11,
                valueTextStyle: regular11,
                emptyPoint: true),
            enumRow(
                point: '5.',
                value:
                    'Warunkiem wypłaty kilometrówki jest prawidłowe złożenie wniosku dostępnego w aplikacji Sinch (zakładka BAZA WIEDZY) najpóźniej do 5 dnia miesiąca, przed którym wykorzystywany był samochód.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '6.',
                value:
                    'W przypadku świadczenia na rzecz BWS Usług poza stałym miejscem świadczenia Usług przez Usługodawcę, BWS doliczy Usługodawcy do wynagrodzenia za wykonanie danej Umowy Szczegółowej koszty poniesione przez Usługodawcę celem dojazdu na miejsce wykonania Umowy Szczegółowej, pod warunkiem uzyskania przez Usługodawcę uprzedniej akceptacji wysokości poniesionych kosztów oraz przedłożenia BWS przez Usługodawcę rachunków potwierdzających faktyczne poniesienie tych kosztów przez Usługodawcę.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '7.',
                value:
                    'Zapłata przez BWS należnego Usługodawcy wynagrodzenia za wykonanie Umowy Szczegółowej zostanie dokonana najpóźniej w terminie 14 (słownie: czternastu) dni od dnia zakończenia wykonywania przez Usługodawcę danej Umowy Szczegółowej.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            para
          ]);
        });
    document.addPage(page);
    return document.save();
  }

  pw.RichText boldAndRegular(String boldValue, String regularValue,
      pw.TextStyle bold, pw.TextStyle regular) {
    return pw.RichText(
        text: pw.TextSpan(children: [
      pw.TextSpan(text: boldValue, style: bold),
      pw.TextSpan(text: regularValue, style: regular)
    ]));
  }

  pw.Row enumRow(
      {required String point,
      required String value,
      required pw.TextStyle pointTextStyle,
      required pw.TextStyle valueTextStyle,
      bool emptyPoint = false}) {
    return pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.Container(
        margin: pw.EdgeInsets.only(right: emptyPoint ? 16 : 8),
        child: pw.Text(point, style: pointTextStyle),
      ),
      pw.Expanded(
        child: pw.Text(value, style: valueTextStyle),
      )
    ]);
  }

  pw.Row enumRowWithRichText(
      {required String point,
      required pw.RichText value,
      required pw.TextStyle pointTextStyle,
      required pw.TextStyle valueTextStyle}) {
    return pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.Container(
        margin: pw.EdgeInsets.only(right: 8),
        child: pw.Text(point, style: pointTextStyle),
      ),
      pw.Expanded(
        child: value,
      )
    ]);
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

class NormalAgreementTexts {
  static String bwsData =
      "spółką BWS Event Support Sp. z o.o. z siedzibą w Krakowie 31-559, przy ul. Na Szaniec 7, NIP 6751759898, KRS 0000944605, reprezentowaną przez pełnomocnika: Imię i nazwisko, PESEL, seria i numer dokumentu, pełnomocnictwo z dnia - DZIEŃ PODPISANIA PEŁNOMOCNICTWA, zwaną w dalszej części Umowy: „BWS” a zleceniobiorcą posługującym się danymi: ";

  static String howDataWasVerified =
      "co zostało stwierdzone w oparciu o okazany dowód osobisty/dokument tożsamości,działającym osobiście,zwanym w dalszej części Umowy: „Usługodawcą”,";

  static String howSidesAreCalled =
      "przy czym BWS i Usługodawca łącznie w dalszej części Umowy zwani są „Stronami”, a każde z nich oddzielnie „Stroną”.";

  static String firstPageFirstPoint =
      "BWS jest spółką, której działalność w szczególności związana jest z organizacją, obsługą i zaopatrzeniem technicznym oraz personalnym targów, wystaw, kongresów, festiwali, koncertów, spektakli, innych wydarzeń kulturalnych, eventów i imprez, w tym imprez masowych i plenerowych (zwanych w dalszej części Umowy Wydarzeniami) oraz obsługą magazynów, w tym obsługą polegającą na przeładunku ciężarówek i dokonywaniu inwentaryzacji sprzętu";
  static String firstPageSecondPoint =
      'Usługodawca posiada umiejętności i doświadczenie w zakresie wykonywania czynności fizycznych, w tym w szczególności przeładunku ciężarówek, sprzątania magazynów, montażu i demontażu instalacji oświetlenia lub dźwięku oraz konstrukcji stalowych, jak również doświadczenie i umiejętności wymagane do obsługi wydarzeń,';
  static String firstPageThirdPoint =
      'Strony zawarły Umowę Świadczenia Usług Drogą Elektroniczną Za Pośrednictwem Systemu Sinch,';
  static String firstPageFourthPoint =
      "Strony planują prowadzić długoterminową współpracę,";

  static String firstParagraphFirstPoint =
      "Celem niniejszej Umowy jest określenie zasad współpracy, praw i obowiązków Stron związanych ze świadczeniem Usług przez Usługodawcę na rzecz BWS, oraz kwestii mających zasadnicze znaczenie dla zapewnienia prawidłowej i efektywnej współpracy Stron Umowy, w tym w szczególności tryb zawierania oraz rodzaj i treść Umów Szczegółowych.";

  static String paragraph2point2 =
      "Na potrzeby wykonywania zarówno Umowy jak i poszczególnych umów o świadczenie usług, które zostaną zawarte w związku z niniejszą Umową, Strony wskazują, że następujące pojęcia będą definiowane jak poniżej:";
}
