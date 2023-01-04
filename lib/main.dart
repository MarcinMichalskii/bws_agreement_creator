import 'package:bws_agreement_creator/FormUI/employee_form.dart';
import 'package:bws_agreement_creator/FormUI/employee_form_logic.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EmployeeFormLogic());
  }
}
