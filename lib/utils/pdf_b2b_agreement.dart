import 'package:bws_agreement_creator/form.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfB2bAgreement {
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
                      'zawarta w dniu ${DateFormat('dd.MM.yyyy').format(DateTime.now())} w Krakowie pomiędzy',
                      textAlign: pw.TextAlign.left,
                      style: regular11),
                ),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 4),
                    child: enumRow(
                        point: '1.',
                        value: B2bTexts.bwsData,
                        pointTextStyle: regular11,
                        valueTextStyle: regular11)),
                pw.Container(
                    margin: const pw.EdgeInsets.only(top: 4),
                    child: enumRow(
                        point: '2.',
                        value:
                            'Nazwa firmy: ${form.companyName}\nAdres firmy: ${form.companyAddress} \nNIP: ${form.nip}\nKRS: ${form.krs}\nNumer dokumentu: ${form.passportOrIdNumber}' +
                                onlyCompany(form),
                        pointTextStyle: regular11,
                        valueTextStyle: regular11)),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 8),
                  child: pw.Text(B2bTexts.howDataWasVerified, style: regular11),
                ),
                pw.Text(B2bTexts.howDataWasVerified, style: regular11),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 8),
                  child: pw.Text(B2bTexts.howSidesAreCalled, style: regular11),
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
                        value: B2bTexts.firstPageFirstPoint,
                        pointTextStyle: regular11,
                        valueTextStyle: regular11),
                    enumRow(
                        point: '2)',
                        value: B2bTexts.firstPageSecondPoint,
                        pointTextStyle: regular11,
                        valueTextStyle: regular11),
                    enumRow(
                        point: '3)',
                        value: B2bTexts.firstPageThirdPoint,
                        pointTextStyle: regular11,
                        valueTextStyle: regular11),
                    enumRow(
                        point: '4)',
                        value: B2bTexts.firstPageFourthPoint,
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

  String onlyCompany(FormState form) {
    final String representedBy = '\nReprezentant spółki: ${form.representedBy}';
    final String onlyCompany =
        '\nRola reprezentanta: ${form.roleOfRepresentant}';
    return (form.representedBy.isEmpty || form.roleOfRepresentant.isEmpty)
        ? ''
        : (representedBy + onlyCompany);
  }

  Future<Uint8List> generateAgreementContactData(FormState form) async {
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
                enumRow(
                    point: '',
                    value:
                        'Usługodawca zobowiązany jest bez wezwania do zapłaty na rzecz BWS kary umownej w kwocie 1.000,00 zł (słownie: jeden tysiąc złotych) za każdy przypadek naruszenia.',
                    pointTextStyle: regular11,
                    valueTextStyle: regular11,
                    emptyPoint: true),
                enumRow(
                    point: '4.',
                    value:
                        'W przypadku, w którym Usługodawca naruszy obowiązek zachowania poufności określony w § 7 powyżej, Usługodawca zobowiązany jest bez wezwania do zapłaty na rzecz BWS kary umownej w kwocie 1.000,00 zł (słownie: jeden tysiąc złotych) za każdy przypadek naruszenia.',
                    pointTextStyle: regular11,
                    valueTextStyle: regular11),
                enumRow(
                    point: '5.',
                    value:
                        'Zapłata przez Usługodawcę określonych powyżej kar umownych nie pozbawia BWS prawa dochodzenia od Usługodawcy na zasadach ogólnych odszkodowania przekraczającego wysokość zastrzeżonych kar umownych, do wysokości poniesionej przez BWS szkody.',
                    pointTextStyle: regular11,
                    valueTextStyle: regular11),
                boldParagraph(
                    point: '9', value: 'Status studenta', style: regular11),
                enumRow(
                    point: '1.',
                    value:
                        'Strony zgodnie postanawiają, iż w przypadku, gdyby którekolwiek z postanowień niniejszej Umowy, z mocy prawa lub ostatecznego albo prawomocnego orzeczenia jakiegokolwiek organu administracyjnego lub sądu, zostało uznane za nieważne lub nieskuteczne, pozostałe postanowienia niniejszej Umowy zachowują pełną moc i skuteczność.',
                    pointTextStyle: regular11,
                    valueTextStyle: regular11),
                enumRow(
                    point: '2.',
                    value:
                        'W przypadku wystąpienia okoliczności opisanych w ust. 1 niniejszego paragrafu, Strony zobowiązują się, że w dobrej wierze podejmą wszelkie czynności niezbędne do niezwłocznego i skutecznego zastąpienia postanowień uznanych za nieważne lub nieskuteczne, postanowieniami ważnymi w świetle prawa i w pełni skutecznymi, które wywołują skutki prawne zapewniające realizację celów Stron niniejszej Umowy.',
                    pointTextStyle: regular11,
                    valueTextStyle: regular11),
                boldParagraph(
                    point: '10', value: 'Dane kontaktowe', style: regular11),
                enumRow(
                    point: '1.',
                    value:
                        'BWS wskazuje następujące dane kontaktowe:\n1) Adres do doręczeń: ul. Na Szaniec 7, Kraków\n2) Numer telefonu: 794-222-311\n3) Adres e-mail: office@bws.net.pl ',
                    pointTextStyle: regular11,
                    valueTextStyle: regular11),
                enumRow(
                    point: '2.',
                    value:
                        'Usługodawca wskazuje następujące następujące dane kontaktowe: \nAdres do doręczeń: ${form.companyCity}, ${form.companyAddress} \nNumer telefonu: ${form.phoneNumber}\nAdres-email: ${form.emailAddress}\nKomunikator internetowy: ${form.internetComunicator}',
                    pointTextStyle: regular11,
                    valueTextStyle: regular11),
              ]);
        });
    document.addPage(page);
    return document.save();
  }

  Future<Uint8List> generateAgreementAttachment(FormState form) async {
    final document = pw.Document();
    final birthday = DateFormat('dd.MM.yyyy').format(form.birthday);
    final bold8 = await boldTextStyle(8);
    final bold10 = await boldTextStyle(10);
    final bold14 = await boldTextStyle(14);
    final regular8 = await regulartTextStyle(8);
    final regular10 = await regulartTextStyle(10);
    final regular11 = await regulartTextStyle(11);
    final regular12 = await regulartTextStyle(12);
    final regular12underline = await regulartTextStyle(12, underline: true);
    final additionalEmployees = form.additionalEmployees
        .asMap()
        .map((index, item) {
          return MapEntry(
              index,
              enumRow(
                  point: '${index + 1})',
                  value: '${item.name}, ${item.address}, ${item.pesel}',
                  pointTextStyle: regular10,
                  valueTextStyle: regular10));
        })
        .values
        .toList();

    final page = pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                          child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                            pw.Text(
                                'Załącznik nr 1 do umowy ramowej o świadczenie usług',
                                style: bold10)
                          ])),
                      pw.Expanded(
                          child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.end,
                              children: [
                            pw.Text(
                                'Kraków, ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                style: regular12underline),
                          ])),
                    ]),
                pw.Container(
                  margin: pw.EdgeInsets.fromLTRB(0, 16, 0, 8),
                  child: pw.Center(
                      child:
                          pw.Text('Oświadczenie usługodawcy', style: bold10)),
                ),
                pw.Text(
                    'Ja, niżej podpisany ${form.name} ${form.lastName}, prowadzący działalność gospodarczą pod firmą ${form.companyName} w miejscowości ${form.companyCity}, adres: ${form.companyAddress}, posiadający NIP: ${form.nip}, działając w imieniu własnym, w związku z prowadzeniem przeze mnie wskazanej powyżej działalności gospodarczej oraz w związku z zawarciem przeze mnie ze spółką BWS Event Support Sp. z o.o. (dalej: „BWS”) Umowy Ramowej o Świadczenie Usług z dnia ${DateFormat('dd.MM.yyyy').format(DateTime.now())} (dalej: „Umowa”), na podstawie § 3 ust. 9 Umowy, niniejszym oświadczam, że osoby wskazane na liście przedstawionej poniżej, będącej integralną częścią niniejszego Oświadczenia (dalej: „Lista), są przeze mnie zatrudnione lub wykonują na moją rzecz zawodowo usługi, których zakres pokrywa się z zakresem usług świadczonych przeze mnie na rzecz BWS na podstawie Umowy. W związku z powyższym, osoby wskazane na Liście, są uprawnione do pomagania mi bądź wykonywania w moim imieniu na rzecz BWS usług, o których mowa w Umowie, za co zobowiązuje się do poniesienia względem BWS wszelkiej odpowiedzialności związanej z niewykonaniem lub niewłaściwym przez osoby wskazane na Liście wykonaniem tychże usług, a także zobowiązuje się do naprawienia jakiejkolwiek szkody, którą w związku z tym poniesie BWS lub jej kontrahenci przy wykonywaniu tychże usług na rzecz BWS lub jej kontrahentów.',
                    style: regular10),
                pw.Text(
                    'W szczególności oświadczam, że ponoszę wszelką odpowiedzialność za działania lub zaniechania osób wskazanych na Liście, których osoby te dopuszczą się przy wykonywaniu w moim imieniu usług związanych z wykonaniem Umowy lub pomagając mi przy świadczeniu usług związanych z wykonaniem Umowy. Jednocześnie oświadczam, że osoby wskazane na Liście:',
                    style: regular10),
                pw.Container(
                  margin: pw.EdgeInsets.only(top: 8),
                  child: pw.Bullet(
                      text:
                          'posiadają przewidywane przepisami prawa powszechnie obowiązującego uprawnienia do wykonywania na rzecz BWS usług, o których mowa w Umowie;',
                      style: regular10),
                ),
                pw.Bullet(
                    text:
                        'posiadają odpowiednią wiedzę, przeszkolenie i wyposażenie niezbędne do prawidłowego i terminowego wykonywania w moim imieniu na rzecz BWS usług, o których mowa w Umowie;',
                    style: regular10),
                pw.Bullet(
                    text:
                        'będą przygotowane w sposób niezbędny do świadczenia usług na rzecz BWS w sposób profesjonalny, odpowiedni dla zawodowego charakteru świadczenia usług przeze mnie oraz przez te osoby;',
                    style: regular10),
                pw.Bullet(
                    text:
                        'gwarantuję, że jakość wykonywanych na rzecz BWS przez te osoby usług, będzie odpowiednia do zawodowego charakteru świadczenia usług przeze mnie oraz przez te osoby;',
                    style: regular10),
                pw.Bullet(
                    text:
                        'będą wykonywać usługi na rzecz BWS w stanie całkowitej trzeźwości.',
                    style: regular10),
                pw.Container(
                    margin: pw.EdgeInsets.symmetric(vertical: 8),
                    child: pw.Center(child: pw.Text('Lista', style: bold10))),
                ...additionalEmployees,
                pw.Expanded(
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                      pw.Text('................... \n   Podpis',
                          style: regular12)
                    ]))
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
        margin: const pw.EdgeInsets.only(right: 8),
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
}

class B2bTexts {
  static String bwsData =
      "spółką BWS EVENT SUPPORT spółka z ograniczoną odpowiedzialnością z siedzibą w Krakowie przy ul. Na Szaniec 7, 31-559 Kraków, dla której Sąd Rejonowy dla Krakowa-Śródmieścia w Krakowie XI Wydział Gospodarczy Krajowego Rejestru Sądowego prowadzi akta rejestrowe pod numerem KRS: 0000944605, posiadającą NIP: 6751759898, REGON: 520910120, reprezentowaną przez Prezesa Zarządu – Wojciecha Klonowskiego oraz Wiceprezesa Zarządu – Bartłomieja Stańko, umocowanych do reprezentacji łącznej/ pełnomocnika – Aleksandrę Wróblewską PESEL: 96052509482 działającego na podstawie pełnomocnictwa z dnia 1.10.2022r, okazanego Usługodawcy w dniu podpisania niniejszej Umowy, zwaną dalej „BWS”";
  static String howDataWasVerified =
      "co zostało stwierdzone w oparciu o okazany dowód osobisty/dokument tożsamości,działającym osobiście,zwanym w dalszej części Umowy: „Usługodawcą”,";

  static String howSidesAreCalled =
      'łącznie w dalszej części Umowy zwanymi „Stronami”, a każdy z nich oddzielnie „Stroną”.';

  static String firstPageFirstPoint =
      "BWS jest spółką, której działalność w szczególności związana jest z organizacją, obsługą i zaopatrzeniem technicznym oraz personalnym targów, wystaw, kongresów, festiwali, koncertów, spektakli, innych wydarzeń kulturalnych, eventów i imprez, w tym imprez masowych i plenerowych (zwanych w dalszej części Umowy Wydarzeniami) oraz obsługą magazynów, w tym obsługą polegającą na przeładunku ciężarówek i dokonywaniu inwentaryzacji sprzętu,";
  static String firstPageSecondPoint =
      'Usługodawca posiada umiejętności i doświadczenie w zakresie wykonywania czynności fizycznych, w tym w szczególności przeładunku ciężarówek, sprzątania magazynów, montażu i demontażu instalacji oświetlenia lub dźwięku oraz konstrukcji stalowych, jak również doświadczenie i umiejętności wymagane do obsługi Wydarzeń,';
  static String firstPageThirdPoint =
      'Strony zawarły Umowę Świadczenia Usług Drogą Elektroniczną Za Pośrednictwem Systemu Sinch,';
  static String firstPageFourthPoint =
      "Strony planują prowadzić długoterminową współpracę,";
}
