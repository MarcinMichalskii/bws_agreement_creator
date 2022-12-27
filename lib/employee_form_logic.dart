import 'dart:html' as html;
import 'package:bws_agreement_creator/employee_form.dart';
import 'package:bws_agreement_creator/pdf_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class EmployeeFormLogic extends HookWidget {
  EmployeeFormLogic({super.key});
  var anchor = null;

  @override
  Widget build(BuildContext context) {
    final name = useState('');
    final lastName = useState('');
    final city = useState('');
    final birthDate = useState(DateTime.now());
    final studentStatus = useState(false);
    final nameSet = useCallback((String value) {
      name.value = value;
    }, []);
    final lastnameSet = useCallback((String value) {
      lastName.value = value;
    }, []);
    final citySet = useCallback((String value) {
      city.value = value;
    }, []);
    final birthDateSet = useCallback((DateTime value) {
      birthDate.value = value;
    }, []);

    final studentStatusChanged = useCallback((bool value) {
      studentStatus.value = value;
    }, []);

    final studentIdImage = useState<Image?>(null);

    final onStudentIdRemoveTapped = useCallback(() {
      studentIdImage.value = null;
    }, []);

    final onSelectStudentIdPhotoTapped = useCallback(() async {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      final image = result?.files.first.bytes;
      if (image != null) {
        studentIdImage.value = Image.memory(image);
      }
    }, []);

    Future<void> saveTextFile() async {
      final helper = GeneratePdfHelper();
      final pdfInBytes = await helper.generatePdf(name.value, lastName.value,
          city.value, DateFormat('dd.MM.yyyy').format(birthDate.value));

      final blob = html.Blob([pdfInBytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'umowa.pdf'
        ..click();
      html.document.body?.children.add(anchor);
    }

    final generateButtonTapped = useCallback(() {
      saveTextFile();
    }, [name.value, lastName.value, city.value, birthDate.value]);

    return EmployeeForm(
      selectedDate: birthDate.value,
      nameSet: nameSet,
      lastNameSet: lastnameSet,
      citySet: citySet,
      onBirthDateSet: birthDateSet,
      generateButtonTapped: generateButtonTapped,
      areYouAStudent: studentStatus.value,
      onStudentStatusChanged: studentStatusChanged,
      onSelectStudentIdSelected: onSelectStudentIdPhotoTapped,
      studentIdImage: studentIdImage.value,
      onStudentIdRemoveTapped: onStudentIdRemoveTapped,
    );
  }
}
