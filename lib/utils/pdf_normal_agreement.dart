import 'package:bws_agreement_creator/form.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfNormalAgreement {
  Future<Uint8List> generateAgreementFirstPage(FormState form) async {
    final document = pw.Document();
    final bold10 = await boldTextStyle(10);
    final regular11 = await regulartTextStyle(11);

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
                      'zawarta w dniu ${DateFormat('dd.MM.yyyy').format(form.dateOfSign)} w Krakowie',
                      textAlign: pw.TextAlign.left,
                      style: regular11),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 4),
                  child:
                      pw.Text(NormalAgreementTexts.bwsData, style: regular11),
                ),
                pw.Text(
                    '${form.name} ${form.lastName}\nPESEL/nr. dokumentu: ${form.pesel.isEmpty ? form.passportOrIdNumber : form.pesel}\n${form.placeOfDomicile.city}, ${form.placeOfDomicile.street} ${form.placeOfDomicile.houseNumber}, ${form.placeOfDomicile.flatNumber}',
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
    final bold10 = await boldTextStyle(10);
    final regular11 = await regulartTextStyle(11);

    final page = pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            enumRow(
                point: '7.',
                value:
                    'W przypadku, gdy w trakcie wykonywania Umowy Szczegółowej Usługodawca poweźmie informację, że do jej prawidłowego i terminowego wykonania niezbędne jest niezwłoczne poniesienie dodatkowych kosztów, które uprzednio były niemożliwe do przewidzenia przez BWS lub Usługodawcę i nie są objęte wynagrodzeniem za wykonanie danej Umowy Szczegółowej, Usługodawca zobowiązuje się pokryć te koszty celem terminowego i prawidłowego wykonania Umowy Szczegółowej. W sytuacji opisanej w zdaniu poprzedzającym Usługodawca zobowiązany jest przedłożyć BWS zestawienie takich kosztów wraz z dowodami ich poniesienia (np. faktury, paragony) najpóźniej w terminie 7 (słownie: siedmiu) dni od dnia zakończenia wykonywania przez Usługodawcę danej Umowy Szczegółowej, a BWS zobowiązuje się zwrócić tak poniesione koszty Usługodawcy w terminie 7 dni od dnia doręczenia BWS kompletnej informacji o poniesionych przez Usługodawcę dodatkowych i nieprzewidzianych uprzednio kosztach niezbędnych do prawidłowego i terminowego wykonania Umowy Szczegółowej wraz z dowodami ich poniesienia przez Usługodawcę.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '8.',
                value:
                    'Zapłata przez BWS należnego Usługodawcy wynagrodzenia za wykonanie Umowy Szczegółowej zostanie dokonana najpóźniej w terminie 14 (słownie: czternastu) dni od dnia zakończenia wykonywania przez Usługodawcę danej Umowy Szczegółowej.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            boldParagraph(point: '6', value: 'Status studenta', style: bold10),
            enumRow(
                point: '1.',
                value:
                    'Usługodawca oświadcza, że ${form.isStudent ? 'posiada' : 'nie posiada'} status/u studenta lub ucznia, w rozumieniu ustawy z dnia z dnia 13 października 1998 r. o systemie ubezpieczeń społecznych ${worksForOtherCompanyText(form.worksForOtherEmployee, form.earnsMoreThanMinimalWage)}',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '2.',
                value:
                    'Usługodawca oświadcza, iż nie chce aby BWS odprowadzał za niego składkę chorobową.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '3.',
                value:
                    'Usługodawca zobowiązuje się do niezwłocznego powiadomienia płatnika o każdej zmianie stanu faktycznego wynikającego z powyższych punktów § 7 pod rygorem przeniesienia na Usługodawcę odpowiedzialności finansowej za nieopłacone składki i podatki, wynikające ze zmianu stanu faktycznego.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            boldParagraph(point: '7', value: 'Poufność', style: bold10),
            enumRow(
                point: '1.',
                value:
                    'Przez Informacje Poufne rozumie się treść niniejszej Umowy oraz wszystkie dokumenty i informacje, w tym w szczególności informacje handlowe, techniczne, know-how o technicznym, handlowym, finansowym i każdym innym charakterze, materiały, graficzne komunikaty, specyfikacje, rysunki, elektroniczne i inne informacje, związane z działalnością BWS, partnerów BWS lub klientów BWS, ujawnione, udostępnione lub przekazane przez BWS, partnerów BWS lub klientów BWS Usługodawcy ustnie, na piśmie lub w jakikolwiek inny sposób, jak również uzyskane przy wykonywaniu lub w związku z wykonywaniem niniejszej Umowy przez Usługodawcę w jakikolwiek formie i w jakikolwiek sposób. Usługodawca zobowiązuje się Informacje Poufne zabezpieczyć przed dostępem osób trzecich, nie ujawniać, nie przekazywać ani nie udostępniać, w całości lub części, osobom trzecim bez uprzedniej pisemnej zgody BWS.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
          ]);
        });
    document.addPage(page);
    return document.save();
  }

  Future<Uint8List> generateContactDataPage(FormState form) async {
    final document = pw.Document();
    final bold10 = await boldTextStyle(10);
    final bold11 = await boldTextStyle(11);
    final regular11 = await regulartTextStyle(11);

    final page = pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            boldParagraph(point: '11', value: 'Dane kontaktowe', style: bold10),
            enumRow(
                point: '1.',
                value:
                    'Usługodawca wskazuje następujące dane kontaktowe:\n1) Adres do doręczeń: ${form.placeOfDomicile.city}, ul. ${form.placeOfDomicile.street} ${form.placeOfDomicile.houseNumber} / ${form.placeOfDomicile.flatNumber} \n2) Numer telefonu: ${form.phoneNumber}\n3) Adres e-mail: ${form.emailAddress}',
                pointTextStyle: bold11,
                valueTextStyle: bold11),
            enumRow(
                point: '2.',
                value:
                    'BWS wskazuje następujące dane kontaktowe:\n1) Adres do doręczeń: ul. Na Szaniec 7, 31-559 Kraków\n2) Numer telefonu: 794-002-660\n3) Adres e-mail: office@bws.net.pl Komunikator internetowy: messenger',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '3.',
                value:
                    'Każda ze Stron w przypadku zmiany adresu do doręczeń wskazanego w niniejszym paragrafie jest zobowiązana niezwłocznie, w terminie nie dłuższym niż 14 (słownie: czternaście) dni poinformować drugą Stronę o tej zmianie. Pismo doręczone na adres wskazany w Umowie, prawidłowo awizowane przez Urząd Pocztowy, a nie podjęte w terminie i zwrócone Stronie, traktowane będzie jako doręczone w dacie pierwszego wezwania',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '4.',
                value:
                    'Zmiany danych kontaktowych wskazanych w ust. 1 i 2 niniejszego paragrafu nie wymagają zmiany niniejszej Umowy.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            boldParagraph(
                point: '12', value: 'Postanowienie końcowe', style: bold10),
            enumRow(
                point: '1.',
                value:
                    'W zakresie nieuregulowanym w niniejszej Umowie znajdują zastosowanie właściwe przepisy obowiązującego prawa polskiego, w tym w szczególności przepisy ustawy z dnia 23 kwietnia 1964 roku - Kodeks cywilny.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '2.',
                value:
                    'Wszelkie zmiany niniejszej Umowy wymagają zachowania formy pisemnej lub dokumentowej pod rygorem nieważności.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '3.',
                value:
                    'Tytuły poszczególnych paragrafów Umowy mają znaczenie jedynie informacyjne. Tytuły poszczególnych paragrafów Umowy nie stanowią wiążących postanowień umownych, jak również nie stanowią wskazówek interpretacyjnych i nie mogą zostać wykorzystane do wykładni Umowy.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            enumRow(
                point: '4.',
                value:
                    'Niniejszą Umowę sporządzono w dwóch jednobrzmiących egzemplarzach, po jednym dla każdej ze Stron.',
                pointTextStyle: regular11,
                valueTextStyle: regular11),
            pw.Container(
                margin: pw.EdgeInsets.only(top: 24),
                child: pw.Row(children: [
                  pw.Expanded(
                      child: pw.Row(children: [
                    pw.Text('................... \n   Bws', style: bold10),
                  ])),
                  pw.Expanded(
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                        pw.Text(
                            '........................................ \n     Usługodawca',
                            style: bold10)
                      ]))
                ])),
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

  pw.Widget boldParagraph({
    required String point,
    required String value,
    required pw.TextStyle style,
  }) {
    return pw.Container(
        margin: pw.EdgeInsets.symmetric(vertical: 12),
        child: pw.Column(children: [
          pw.Center(child: pw.Text('§ $point', style: style)),
          pw.Center(child: pw.Text(value, style: style)),
        ]));
  }

  String worksForOtherCompanyText(
      bool worksForOtherCompany, bool earnsMoreThanMinimum) {
    if (!worksForOtherCompany) {
      return '';
    }
    final earnsMoreThanMimimalText = earnsMoreThanMinimum
        ? 'gdzie, zarabia gdzie zarabia co najmniej minimalną krajową w skali miesiąca (3010zł brutto)'
        : 'gdzie zarabia mniej niż minimalną krajową w skali miesiąca (3010zł brutto).';
    final worksForOtherCompanyText =
        'oraz jest zatrudniony w innym przedsiębiorstwie ${worksForOtherCompany ? earnsMoreThanMimimalText : ''}';
    return worksForOtherCompanyText;
  }
}

class NormalAgreementTexts {
  static String bwsData =
      "spółką BWS Event Support Sp. z o.o. z siedzibą w Krakowie 31-559, przy ul. Na Szaniec 7, NIP 6751759898, KRS 0000944605, reprezentowaną przez pełnomocnika: Aleksandra Wróblewską, PESEL: 96052509482, pełnomocnictwo z dnia 1.10.2022, zwaną w dalszej części Umowy: „BWS” a zleceniobiorcą posługującym się danymi: ";

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
