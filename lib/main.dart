import 'package:bws_agreement_creator/Fonts.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/Login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedin = useState(false);

    final onLoginButtonTapped = useCallback(() {
      isLoggedin.value = true;
    }, []);
    return MaterialApp(
        home: isLoggedin.value
            ? EmployeeFormWidget()
            : LoginWidget(
                onLoginTapped: onLoginButtonTapped,
              ));
  }
}
