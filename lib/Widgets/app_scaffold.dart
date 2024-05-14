import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Widgets/SideMenu/side_menu.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
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
      drawer: isDekstop(context) ? null : const SideMenu(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              constraints:
                  const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
              child: body),
        ],
      ),
      backgroundColor: CustomColors.mainBackground,
    );
  }
}
