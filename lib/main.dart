import 'package:bws_agreement_creator/Fonts.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/Login/login_widget.dart';
import 'package:bws_agreement_creator/FormUI/Providers/login_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:dio/dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final boldFont = await PdfGoogleFonts.openSansBold();
  final regularFont = await PdfGoogleFonts.openSansRegular();
  defaultFonts.bold = boldFont;
  defaultFonts.regular = regularFont;
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isLoggedIn = ref.watch(loginProvider).data != null;

    final onLoginButtonTapped = useCallback((bool isLoggedIn) {}, []);
    return MaterialApp(
        home: isLoggedIn
            ? EmployeeFormWidget()
            : LoginWidget(
                onLoginTapped: onLoginButtonTapped,
              ));
  }
}
