import 'dart:typed_data';

import 'package:bws_agreement_creator/Model/new_form_data.dart';
import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/utils/pdf_b2b_agreement_new.dart';
import 'package:bws_agreement_creator/utils/pdf_new_normal_agreement.dart';
import 'package:bws_agreement_creator/utils/preview_pdf_mobile.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:bws_agreement_creator/utils/uint8list_extension.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PreviewPdfGenerator {
  static showPreviewForMobile(BuildContext context, Uint8List data) async {
    final path = await savePdfAsFile(data, 'preview'.tr());
    final pdfWidget = PDFPreviewPage(filePath: path);

    if (context.mounted) {
      showDialog(
          context: context,
          builder: (context) {
            return pdfWidget;
          });
    }
  }

  static showSelectedPagePreviewForMobile(
      BuildContext context, SelectedPage selectedPage) async {
    final formData = await selectedPage.templateData;
    if (formData == null) {
      return;
    }
    final data = await PreviewPdfGenerator.generatePdfFor(formData);
    showPreviewForMobile(context, data);
  }

  static Future<void> generatePreviewForData(
      {required Uint8List data, String? name}) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    final unwrappedName = name ?? 'preview'.tr();
    if (webBrowserInfo.browserName.name == 'safari') {
      data.saveToFiles(unwrappedName);
    } else {
      data.openInNewTab();
    }
  }

  static Future<void> generatePreview(SelectedPage selectedPage) async {
    final formData = await selectedPage.templateData;
    if (formData == null) {
      return;
    }

    final selectedAgreementData = await generatePdfFor(formData);
    generatePreviewForData(
        data: selectedAgreementData, name: 'podglad_${formData.pdfFileName}');
  }

  static Future<Uint8List> generatePdfFor(NewFormData formData) async {
    final pdf = PdfNormalAgreementNew().generateNormalAgreement(formData);
    final pdfB2b = PdfB2BAgreementNew().generateB2bPdf(formData);
    final selectedAgreement =
        formData.b2bCompanyName?.emptyAsNull() != null ? pdfB2b : pdf;
    final selectedAgreementData = await selectedAgreement.save();
    return selectedAgreementData;
  }
}
