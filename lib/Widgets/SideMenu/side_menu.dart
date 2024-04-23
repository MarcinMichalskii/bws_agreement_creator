import 'dart:math';

import 'package:bws_agreement_creator/Widgets/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/Widgets/FormUI/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

const minDrawerWidth = 150;

class SideMenu extends HookConsumerWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isCollapsedState = useState(false);
    final isLoggedIn = ref.watch(appStateProvider).isLoggedIn;

    if (!isLoggedIn || !kIsWeb) {
      return const SizedBox.shrink();
    }

    final double drawerWidth =
        min(MediaQuery.of(context).size.width * 0.2, 300);
    final isBelowMinWidth = drawerWidth < minDrawerWidth;
    final isCollapsed = isCollapsedState.value || isBelowMinWidth;

    return Drawer(
      backgroundColor: CustomColors.mainBackground,
      width: isCollapsed ? 50 : drawerWidth,
      child: SingleChildScrollView(
        child: Column(children: [
          _Header(
              isCollapsed: isCollapsed,
              isBelowMinWidth: isBelowMinWidth,
              isCollapsedState: isCollapsedState),
          DrawerListTile(
              isCollapsed: isCollapsed,
              title: 'Generator umów',
              icon: Icons.upload_file_outlined,
              onTap: () {}),
          DrawerListTile(
              isCollapsed: isCollapsed,
              title: 'Szkolenia',
              icon: Icons.school_outlined,
              onTap: () {}),
        ]),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.isCollapsed,
    required this.isBelowMinWidth,
    required this.isCollapsedState,
  });

  final bool isCollapsed;
  final bool isBelowMinWidth;
  final ValueNotifier<bool> isCollapsedState;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: SizedBox(
      child: Stack(children: [
        BwsLogo(),
        // SizedBox.expand(child: isCollapsed ? Images.logoSmall : Images.appLogo),
        if (!isCollapsed)
          const Positioned(bottom: 0, left: 0, child: _LogoutTextButton()),
        if (!isBelowMinWidth)
          Positioned(
              right: 0,
              top: 0,
              child: TouchableOpacity(
                onTap: () => isCollapsedState.value = !isCollapsedState.value,
                child: Icon(
                    color: CustomColors.gray,
                    isCollapsed ? Icons.chevron_right : Icons.chevron_left),
              ))
      ]),
    ));
  }
}

class _LogoutTextButton extends ConsumerWidget {
  const _LogoutTextButton();

  @override
  Widget build(BuildContext context, ref) {
    return TouchableOpacity(
      onTap: () {},
      child: Text('logout'.tr(),
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon,
      required this.isCollapsed,
      this.isLoading = false,
      this.labelColor});

  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final bool isCollapsed;
  final bool isLoading;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: CustomColors.almostBlack2,
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(
                left: isCollapsed ? 0 : 12, top: 10, bottom: 10),
            child: isLoading
                ? Row(
                    children: const [
                      // Loading(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: isCollapsed
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                        Icon(
                          icon,
                          size: min(constraints.maxWidth, 30),
                          color: CustomColors.applicationColorMain,
                        ),
                        if (!isCollapsed)
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 2),
                            child: Text(title,
                                style: TextStyle(
                                  color: CustomColors.gray,
                                  fontSize: 13,
                                )),
                          ),
                      ]),
          ),
        ),
      );
    });
  }
}
