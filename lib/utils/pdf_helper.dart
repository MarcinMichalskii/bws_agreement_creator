import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:bws_agreement_creator/utils/pdf_earnings_statement.dart';
import 'package:bws_agreement_creator/utils/pdf_normal_agreement.dart';
import 'package:bws_agreement_creator/utils/pdf_parent_statement.dart';
import 'package:flutter/foundation.dart';
import 'package:pdf/widgets.dart' as pw;

class GeneratePdfHelper {
  Future<Uint8List> generatePdf(FormState form) async {
    final document = pw.Document();
    final earningsStatementPage =
        await PdfEarningsStatment().generatePdfPage(form);
    final agreement =
        await PdfNormalAgreement().generateAgreementFirstPage(form);
    final parentStatementPage = await PdfParentStatment().generatePdfPage(form);
    document.addPage(earningsStatementPage);
    if (!form.birthday.isAdult()) {
      document.addPage(parentStatementPage);
    }
    // document.addPage(agreement);

    return document.save();
  }
}
