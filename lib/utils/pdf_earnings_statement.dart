import 'dart:html';

import 'package:bws_agreement_creator/form.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/foundation.dart';
import 'package:printing/printing.dart';

class PdfEarningsStatment {
  Future<Uint8List> generatePdfPage(FormState form) async {
    final document = pw.Document();
    final birthday = DateFormat('dd.MM.yyyy').format(form.birthday);
    final bold8 = await boldTextStyle(8);
    final bold14 = await boldTextStyle(14);
    final regular8 = await regulartTextStyle(8);
    final regular10 = await regulartTextStyle(10);
    final regular12 = await regulartTextStyle(12);
    final regular12underline = await regulartTextStyle(12, underline: true);

    final page = pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Oświadczenie zleceniobiorcy', style: bold14),
                pw.Text('w celu ustalenia obowiązku ubezpieczeń',
                    style: regular10),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: pw.Text('Dane osobowe: ', style: regular12underline),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 8),
                  child: dataRow('Imię: ', form.name, "Nazwisko: ",
                      form.lastName, bold8, regular8),
                ),
                dataRow('Data urodzenia: ', birthday, 'PESEL: ', form.pesel,
                    bold8, regular8),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: pw.Text('Miejsce zameldowania: ',
                      style: regular12underline),
                ),
                dataRow(
                    'Ulica: ',
                    form.placeOfDomicile.street,
                    'Nr domu: ',
                    '${form.placeOfDomicile.houseNumber} m. ${form.placeOfDomicile.flatNumber}',
                    bold8,
                    regular8),
                dataRow(
                    'Kod pocztowy: ',
                    form.placeOfDomicile.zipCode,
                    'Miejscowość: ',
                    form.placeOfDomicile.city,
                    bold8,
                    regular8),
                dataRow(
                    'Kraj: ',
                    form.placeOfDomicile.country,
                    'Obywatelstwo: ',
                    form.placeOfDomicile.citizenship,
                    bold8,
                    regular8),
                if (!form.placeOfLiving.isEmpty)
                  pw.Container(
                    margin: const pw.EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: pw.Text('Miejsce zamieszkania: ',
                        style: regular12underline),
                  ),
                if (!form.placeOfLiving.isEmpty)
                  dataRow(
                      'Ulica: ',
                      form.placeOfLiving.street,
                      'Nr domu: ',
                      '${form.placeOfLiving.houseNumber} m. ${form.placeOfLiving.flatNumber}',
                      bold8,
                      regular8),
                if (!form.placeOfLiving.isEmpty)
                  dataRow(
                      'Kod pocztowy: ',
                      form.placeOfLiving.zipCode,
                      'Miejscowość: ',
                      form.placeOfLiving.city,
                      bold8,
                      regular8),
                if (!form.placeOfLiving.isEmpty)
                  dataRow(
                      'Kraj: ',
                      form.placeOfLiving.country,
                      'Obywatelstwo: ',
                      form.placeOfLiving.citizenship,
                      bold8,
                      regular8),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: pw.Text('Oświadczam że: ', style: regular12underline),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: pw.Text(
                      'A) ${worksInOtherCompanyZlec(form.worksInOtherCompany, form.otherCompanyName, form.earnsMoreThanMinimalWage, form.agreementWithTime, form.agreementWithTimeStart, form.agreementWithTimeEnd)}',
                      style: regular12),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: pw.Text('B) Nie prowadzę działalności gospodarczej',
                      style: regular12),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: pw.Text(
                      'C) ${retirementText(form.hasRetiring, DateFormat('dd.MM.yyyy').format(form.retiringDecizionDate), form.retiringSignature)}',
                      style: regular12),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: pw.Text(
                      'D) ${rentText(form.hasRent, DateFormat('dd.MM.yyyy').format(form.rentDecisizionDate), form.rentSignature)}',
                      style: regular12),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: pw.Text('E) ${isInvalid(form.invalidStatus)}',
                      style: regular12),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: pw.Text(
                      'F) ${studentText(form.isStudent, form.schoolName)}',
                      style: regular12),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 12, 0, 18),
                  child: pw.Text(
                      'Oświadczam, że powyższe zgłoszenie wypełniłem zgodnie z prawdą i że świadomy jestem odpowiedzialności karnej z art. 233 § 1 kodeksu karnego za zeznawanie nieprawdy lub zatajenie prawdy.\nO wszelkich zmianach w stosunku do danych zawartych w niniejszym oświadczeniu zobowiązuję się powiadomić zleceniodawcę',
                      style: regular10),
                ),
                pw.Row(children: [
                  pw.Expanded(
                      child: pw.Row(children: [
                    pw.Text(
                        'Data: ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                        style: regular12underline),
                  ])),
                  pw.Expanded(
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                        pw.Text('................... \n   Podpis',
                            style: regular12)
                      ]))
                ])
              ]);
        });
    document.addPage(page);
    return document.save();
  }

  pw.Widget dataRow(
      String header,
      String value,
      String secondHeader,
      String secondValue,
      pw.TextStyle headerTextStyle,
      pw.TextStyle valueTextStyle) {
    return pw.Row(children: [
      pw.Expanded(
          child: pw.Row(children: [
        pw.Text(header, style: headerTextStyle),
        pw.Text(value, style: valueTextStyle)
      ])),
      pw.Expanded(
          child: pw.Row(children: [
        pw.Text(secondHeader, style: headerTextStyle),
        pw.Text(secondValue, style: valueTextStyle)
      ]))
    ]);
  }

  String worksInOtherCompanyZlec(
      bool worksInOtherCompany,
      String companyName,
      bool earnsMore,
      bool agreementWithTime,
      DateTime startsAt,
      DateTime endsAt) {
    final worksInOtherCompanyText =
        (worksInOtherCompany ? 'Pracuję ' : 'Nie pracuję ') +
            'w innym zakładzie pracy\n';
    final companyNameText =
        worksInOtherCompany ? 'Nazwa zakładu: $companyName' : '';
    final earnsMoreText = worksInOtherCompany
        ? '\nZ tytułu zatrudnienia osiągam dochód ${earnsMore ? 'niższy' : 'wyższy'} wyższy niż minimalne wynagrodzenie'
        : '';
    final timeOfAgreement = agreementWithTime
        ? '\n - Umowa obowiązuje od dnia ${DateFormat('dd.MM.yyyy').format(startsAt)} do dnia ${DateFormat('dd.MM.yyyy').format(endsAt)}'
        : '';
    return worksInOtherCompanyText +
        companyNameText +
        earnsMoreText +
        timeOfAgreement;
  }

  String retirementText(
      bool hasRetirment, String decisionDate, String decisionSignature) {
    final hasRetirementText =
        (hasRetirment ? 'Jestem' : 'Nie jestem') + ' uprawniony do emerytury ';
    return hasRetirementText +
        (hasRetirment
            ? 'ustalonej decyzją oddziału ZUS z dnia $decisionDate o znaku: $decisionSignature'
            : '');
  }

  String rentText(bool hasRent, String decisionDate, String decisionSignature) {
    final hasRetirementText =
        (hasRent ? 'Jestem' : 'Nie jestem') + ' uprawniony do renty ';
    return hasRetirementText +
        (hasRent
            ? 'ustalonej decyzją oddziału ZUS z dnia $decisionDate o znaku: $decisionSignature'
            : '');
  }

  String studentText(bool isStudent, String schoolName) {
    return (isStudent ? 'Jestem' : 'Nie jestem') +
        ' uczniem/studentem ' +
        (isStudent ? 'szkoły: $schoolName' : '');
  }

  String isInvalid(bool isInvalid) {
    return '${isInvalid ? 'Posiadam' : 'Nie posiadam'} orzeczenie o stopniu niezdolności do pracy ' +
        (isInvalid ? '(należy dołączyć orzeczenie organu orzekającego)' : '');
  }

  // String sickInsuracne(bool sickInsurance) {
  //   return '${sickInsurance ? 'Wnoszę' : 'Nie wnoszę'} o objęcie mnie dobrowolnym ubezpieczenim chorobowym';
  // }

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
