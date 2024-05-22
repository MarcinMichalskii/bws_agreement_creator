import 'dart:math';

import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bws_logo.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/user_data_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const minDrawerWidth = 150;

class SideMenu extends HookConsumerWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isLoggedIn = ref.watch(appStateProvider).isLoggedIn;

    if (!isLoggedIn) {
      return const SizedBox.shrink();
    }

    return Drawer(
      backgroundColor: CustomColors.mainBackground,
      child: SingleChildScrollView(
        child: Column(children: [
          const SideMenuHeader(),
          DrawerListTile(
              isCollapsed: false,
              title: 'Generator umów',
              icon: Icons.upload_file_outlined,
              onTap: () {
                context.pushScreen('employeeFormWidget');
              }),
          DrawerListTile(
              isCollapsed: false,
              title: 'Szkolenia',
              icon: Icons.school_outlined,
              onTap: () {
                context.pushScreen('trainings');
              }),
          if (ref.watch(profileProvider).data?.isAdmin == true)
            DrawerListTile(
                isCollapsed: false,
                title: 'Zarządzaj szkoleniami',
                icon: Icons.video_settings_outlined,
                onTap: () {
                  context.pushScreen('manageTrainings');
                }),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: DrawerListTile(
                isCollapsed: false,
                title: 'Wyloguj',
                icon: Icons.door_back_door_outlined,
                onTap: () {
                  UserDataHelper().cleanupUserData();
                  ref.read(appStateProvider.notifier).setDefaultState();
                  ref.read(notAStudentTapped.notifier).state = false;
                  ref.read(profileProvider.notifier).setDefaultState();
                }),
          ),
        ]),
      ),
    );
  }
}

class SideMenuHeader extends StatelessWidget {
  const SideMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Stack(children: [
        Padding(padding: const EdgeInsets.all(24), child: BwsLogo()),
      ]),
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
            child: Row(
                mainAxisAlignment: isCollapsed
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: min(constraints.maxWidth, 30),
                    color: CustomColors.applicationColorMain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 2),
                    child: Text(title,
                        style: const TextStyle(
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
