import 'dart:typed_data';

import 'package:bws_agreement_creator/Model/profile_data.dart';
import 'package:bws_agreement_creator/Model/raport_generator_data.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Pdf/checkmark_pdf_table_row.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Pdf/default_pdf_table_row.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Pdf/header_text_pdf_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Pdf/raport_generator_dictionary.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Pdf/raport_signature.dart';
import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> createPdfWithTable(
    RaportGeneratorData raportData, ProfileData profile) async {
  final pdf = pw.Document();
  final dictionary = RaportGeneratorDictionary();

  final bwsSignature = await raportData.signatureBwsBytes;
  final clientSignature = await raportData.signatureClientBytes;

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              HeaderTextPdfWidget().generate(title: dictionary.order),
              pw.Text(
                dictionary.orderDescription,
                style: defaultFonts.regularStyle,
              ),
              pw.SizedBox(height: 10),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  DefaultTableRowWidget(
                          title: dictionary.client,
                          value: raportData.location!.client)
                      .tableRow(),
                  DefaultTableRowWidget(
                          title: dictionary.address,
                          value: raportData.location!.address)
                      .tableRow(),
                  DefaultTableRowWidget(
                          title: dictionary.projectManager,
                          value: raportData.projectManager)
                      .tableRow(),
                  DefaultTableRowWidget(
                          title: dictionary.contractor,
                          value: dictionary.contractorData)
                      .tableRow(),
                  DefaultTableRowWidget(
                          title: dictionary.address,
                          value: dictionary.contractorAddress)
                      .tableRow(),
                  DefaultTableRowWidget(
                          title: dictionary.bwsManager, value: profile.name)
                      .tableRow(),
                  DefaultTableRowWidget(
                          title: dictionary.tradeFair,
                          value: raportData.tradeFair)
                      .tableRow(),
                  DefaultTableRowWidget(
                          title: dictionary.startOfConstruction,
                          value: raportData.startDate.toReadableDate())
                      .tableRow(),
                  DefaultTableRowWidget(
                          title: dictionary.endOfConstruction,
                          value: raportData.endDate.toReadableDate())
                      .tableRow(),
                  DefaultTableRowWidget(
                          title: dictionary.price,
                          value: raportData.location?.description ?? '')
                      .tableRow(),
                ],
              ),
              pw.SizedBox(height: 10),
              HeaderTextPdfWidget().generate(title: dictionary.riggingServices),
              pw.SizedBox(height: 10),
              pw.Table(border: pw.TableBorder.all(), columnWidths: {
                0: pw.FlexColumnWidth(0.1),
                1: pw.FlexColumnWidth(0.9),
              }, children: [
                CheckmarkTableRowWidget(
                  isChecked: raportData.ropeSuspensionsIntalation,
                  title: dictionary.ropeSupsensionsInstalltion,
                ).tableRow(),
                CheckmarkTableRowWidget(
                        isChecked: raportData.ropeSuspensionsUninstalation,
                        title: dictionary.ropeSupsensionsDeinstallation)
                    .tableRow(),
                CheckmarkTableRowWidget(
                        isChecked: raportData.otherServices,
                        title: dictionary.otherServices)
                    .tableRow(),
              ]),
              pw.Table(border: pw.TableBorder.all(), children: [
                DefaultTableRowWidget(
                        title: dictionary.otherServicesDescription,
                        value: raportData.otherServicesDescription)
                    .tableRow(),
                DefaultTableRowWidget(
                        title: dictionary.hall, value: raportData.hall)
                    .tableRow(),
                DefaultTableRowWidget(
                        title: dictionary.stand, value: raportData.stand)
                    .tableRow(),
                DefaultTableRowWidget(
                        title: dictionary.exhibitor,
                        value: raportData.exhibitor)
                    .tableRow(),
                DefaultTableRowWidget(
                        title: dictionary.completionTime,
                        value: raportData.completionTime.toReadableDate())
                    .tableRow(),
                DefaultTableRowWidget(
                        title: dictionary.endOfConstruction,
                        value: raportData.disassemblyDate.toReadableDate())
                    .tableRow()
              ]),
              RaportSignaturePdfWidget().generate(
                  signatureData: clientSignature,
                  bwsSignatureData: bwsSignature),
              pw.SizedBox(height: 24),
              if (raportData.isAcceptanceOn) ...[
                HeaderTextPdfWidget().generate(title: dictionary.acceptance),
                pw.SizedBox(height: 10),
                pw.Table(
                  border: pw.TableBorder.all(),
                  columnWidths: {
                    0: pw.FlexColumnWidth(0.6),
                    1: pw.FlexColumnWidth(0.4),
                  },
                  children: [
                    CheckmarkTableRowWidget(
                            isChecked: raportData.acceptance,
                            title: dictionary.acceptanceDescription,
                            rowsReversed: true,
                            checkmarkSize: 32)
                        .tableRow(),
                    DefaultTableRowWidget(
                            title: dictionary.deffectsDescription,
                            value: raportData.deffects)
                        .tableRow(),
                    DefaultTableRowWidget(
                            title: dictionary.deffectsSolution,
                            value: raportData.deffectsSolution)
                        .tableRow(),
                    CheckmarkTableRowWidget(
                            isChecked: raportData.deffectsResolved,
                            title: dictionary.deffectsResolved,
                            rowsReversed: true,
                            checkmarkSize: 32)
                        .tableRow(),
                  ],
                ),
                RaportSignaturePdfWidget().generate(
                    signatureData: clientSignature,
                    bwsSignatureData: bwsSignature),
              ]
            ],
          )
        ];
      },
    ),
  );

  final data = await pdf.save();
  return data;
}
