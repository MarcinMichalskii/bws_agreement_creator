import 'package:bws_agreement_creator/Providers/snackbar_message_provider.dart';
import 'package:bws_agreement_creator/Widgets/SideMenu/side_menu.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppScaffold extends HookConsumerWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;

  const AppScaffold({
    Key? key,
    required this.body,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(snackbarProvider, (previous, next) {
      if (next == null) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: next.color ?? CustomColors.applicationColorMain,
          content: Text(next.message, style: const TextStyle(fontSize: 16))));
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !kIsWeb,
        backgroundColor: CustomColors.mainBackground,
        elevation: 0,
        iconTheme: const IconThemeData(color: CustomColors.gray),
        title: Text(title ?? '',
            style: const TextStyle(color: CustomColors.gray, fontSize: 17)),
        actions: actions,
      ),
      drawer: kIsWeb ? null : const SideMenu(),
      body: body,
      backgroundColor: CustomColors.mainBackground,
    );
  }
}
