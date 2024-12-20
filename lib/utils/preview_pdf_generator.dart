import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/utils/pdf_b2b_agreement_new.dart';
import 'package:bws_agreement_creator/utils/pdf_new_normal_agreement.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:bws_agreement_creator/utils/uint8list_extension.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PreviewPdfGenerator {
  static Future<void> generatePreview(SelectedPage selectedPage) async {
    final formData = await selectedPage.templateData;
    if (formData == null) {
      return;
    }
    final pdf = PdfNormalAgreementNew().generateNormalAgreement(formData);
    final pdfB2b = PdfB2BAgreementNew().generateB2bPdf(formData);
    final selectedAgreement =
        formData.b2bCompanyName?.emptyAsNull() != null ? pdfB2b : pdf;
    final selectedAgreementData = await selectedAgreement.save();

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;

    if (webBrowserInfo.browserName.name == 'safari') {
      selectedAgreementData.saveToFiles('podglad_${formData.pdfFileName}');
    } else {
      selectedAgreementData.openInNewTab();
    }
  }
}
