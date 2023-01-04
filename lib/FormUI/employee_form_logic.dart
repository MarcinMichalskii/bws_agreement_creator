import 'package:bws_agreement_creator/FormUI/employee_form.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/byte_data_extension.dart';
import 'package:bws_agreement_creator/utils/pdf_document_extension.dart';
import 'package:bws_agreement_creator/utils/pdf_helper.dart';
import 'package:bws_agreement_creator/utils/pdf_normal_agreement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class EmployeeFormLogic extends HookConsumerWidget {
  EmployeeFormLogic({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Future<void> saveTextFile() async {
      final formState = ref.read(FormNotifier.provider.notifier).state;
      final helper = GeneratePdfHelper();
      final pdfInBytes = await helper.generatePdf(formState);
      final ByteData pdfFromMemory =
          await rootBundle.load('pdfs/umowaScalona.pdf');
      final pdfAgreementFirstPageData =
          await PdfNormalAgreement().generateAgreementFirstPage(formState);
      final pdfAgreemntFirstPageDoc =
          PdfDocument(inputBytes: pdfAgreementFirstPageData);
      final studentStatusData =
          await PdfNormalAgreement().generateStudentStatusPage(formState);
      final studentStatusPdf = PdfDocument(inputBytes: studentStatusData);
      final pdfAsUint8 = pdfFromMemory.dataAsUint8();

      final docMemory = PdfDocument(inputBytes: pdfAsUint8);
      docMemory.insertCustomPage(pdfAgreemntFirstPageDoc.pages[0], 0);
      docMemory.insertCustomPage(studentStatusPdf.pages[0], 0);

      final doc2 = PdfDocument(inputBytes: pdfInBytes);
      docMemory.insertCustomPage(doc2.pages[0], docMemory.pages.count);
      await docMemory.saveToFiles();
    }

    final generateButtonTapped = useCallback(() {
      saveTextFile();
    }, []);

    return EmployeeForm(
      generateButtonTapped: generateButtonTapped,
    );
  }
}
