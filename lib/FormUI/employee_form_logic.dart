import 'package:bws_agreement_creator/FormUI/employee_form.dart';
import 'package:bws_agreement_creator/FormUI/outbording_information.dart';
import 'package:bws_agreement_creator/FormUI/validation_error.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/byte_data_extension.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:bws_agreement_creator/utils/pdf_b2b_agreement.dart';
import 'package:bws_agreement_creator/utils/pdf_document_extension.dart';
import 'package:bws_agreement_creator/utils/pdf_earnings_statement.dart';
import 'package:bws_agreement_creator/utils/pdf_normal_agreement.dart';
import 'package:bws_agreement_creator/utils/pdf_parent_statement.dart';
import 'package:bws_agreement_creator/utils/pdf_student_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class EmployeeFormLogic extends HookConsumerWidget {
  EmployeeFormLogic({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isLoading = useState(false);
    Future<void> generateDocumentForB2b() async {
      isLoading.value = true;
      final formState = ref.read(FormNotifier.provider.notifier).state;
      final ByteData b2bAgreementData =
          await rootBundle.load('assets/pdfs/umowaScalonaB2b.pdf');
      final b2bPdf = PdfDocument(inputBytes: b2bAgreementData.dataAsUint8());
      final b2bFirstPageData =
          await PdfB2bAgreement().generateAgreementFirstPage(formState);
      final b2bFirstPagePdf = PdfDocument(inputBytes: b2bFirstPageData);
      final b2bFirstContactData =
          await PdfB2bAgreement().generateAgreementContactData(formState);
      final b2bFirstContactPdf = PdfDocument(inputBytes: b2bFirstContactData);
      final b2bAttachmentPageData =
          await PdfB2bAgreement().generateAgreementAttachment(formState);
      final b2bAttachmentPagePdf =
          PdfDocument(inputBytes: b2bAttachmentPageData);
      b2bPdf.insertCustomPage(b2bFirstPagePdf.pages[0], 0);
      b2bPdf.insertCustomPage(b2bFirstContactPdf.pages[0], 8);
      if (formState.additionalEmployees.isNotEmpty) {
        b2bPdf.insertCustomPage(
            b2bAttachmentPagePdf.pages[0], b2bPdf.pages.count);
      }
      b2bPdf.insertPageNumbers();
      await b2bPdf.saveToFiles();
      isLoading.value = false;
    }

    Future<void> generateDocumentForEmployee() async {
      isLoading.value = true;
      final formState = ref.read(FormNotifier.provider.notifier).state;

      final ByteData employeePdfData =
          await rootBundle.load('assets/pdfs/umowaScalona.pdf');
      // print(employeePdfData.lengthInBytes);
      final employeePdf =
          PdfDocument(inputBytes: employeePdfData.dataAsUint8());

      final pdfAgreementFirstPageData =
          await PdfNormalAgreement().generateAgreementFirstPage(formState);
      final pdfAgreemntFirstPagePdf =
          PdfDocument(inputBytes: pdfAgreementFirstPageData);
      final studentStatusData =
          await PdfNormalAgreement().generateStudentStatusPage(formState);
      final employeeContactData =
          await PdfNormalAgreement().generateContactDataPage(formState);
      final studentStatusPdf = PdfDocument(inputBytes: studentStatusData);
      final employeeContactDataPdf =
          PdfDocument(inputBytes: employeeContactData);
      final employeeStatementData =
          await PdfEarningsStatment().generatePdfPage(formState);
      final employeeStatementPdf =
          PdfDocument(inputBytes: employeeStatementData);

      employeePdf.insertCustomPage(pdfAgreemntFirstPagePdf.pages[0], 0);
      employeePdf.insertCustomPage(studentStatusPdf.pages[0], 5);
      employeePdf.insertCustomPage(employeeContactDataPdf.pages[0], 8);
      employeePdf.insertCustomPage(
          employeeStatementPdf.pages[0], employeePdf.pages.count);

      if (!formState.birthday.isAdult()) {
        final parentStatementData =
            await PdfParentStatment().generatePdfPage(formState);
        final parentStatementPdf = PdfDocument(inputBytes: parentStatementData);
        employeePdf.insertCustomPage(
            parentStatementPdf.pages[0], employeePdf.pages.count);
      }

      if (formState.isStudent) {
        final parentStatementData =
            await PdfStudentId().generatePdfPage(formState);
        final parentStatementPdf = PdfDocument(inputBytes: parentStatementData);
        employeePdf.insertCustomPage(
            parentStatementPdf.pages[0], employeePdf.pages.count);
      }
      employeePdf.insertPageNumbers();
      await employeePdf.saveToFiles();
      isLoading.value = false;
    }

    Future<void> saveTextFile() async {
      final formState = ref.read(FormNotifier.provider.notifier).state;
      if (formState.areYouB2b) {
        await generateDocumentForB2b();
      } else {
        await generateDocumentForEmployee();
      }
      showDialog(context: context, builder: (_) => OutbordingInformation());
    }

    final generateButtonTapped = useCallback(() {
      saveTextFile();
    }, []);
    final validationErrorText =
        ref.watch(FormNotifier.provider).validationErrorText;

    final onInvalidFormGenerateTapped = useCallback(() {
      showDialog(
          context: context,
          builder: (_) => ValidationError(
                errorText: validationErrorText ?? "",
              ));
    }, [validationErrorText]);

    return EmployeeForm(
        generateButtonTapped: validationErrorText == null
            ? generateButtonTapped
            : onInvalidFormGenerateTapped,
        isLoading: isLoading.value);
  }
}
