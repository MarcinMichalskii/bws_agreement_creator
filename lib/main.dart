import 'package:bws_agreement_creator/Fonts.dart';
import 'package:bws_agreement_creator/FormUI/employee_form.dart';
import 'package:bws_agreement_creator/FormUI/employee_form_logic.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:printing/printing.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final boldFont = await PdfGoogleFonts.openSansBold();
  final regularFont = await PdfGoogleFonts.openSansRegular();
  defaultFonts.bold = boldFont;
  defaultFonts.regular = regularFont;
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EmployeeFormLogic());
  }
}
