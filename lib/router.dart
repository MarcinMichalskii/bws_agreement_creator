import 'dart:async';

import 'package:bws_agreement_creator/Widgets/FormUI/EmployeeForm/Outboarding/agreement_sent_widget.dart';
import 'package:bws_agreement_creator/Widgets/FormUI/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/FormUI/EmployeeForm/update_student_id_widget.dart';
import 'package:bws_agreement_creator/Widgets/FormUI/Login/login_widget.dart';
import 'package:bws_agreement_creator/Widgets/SideMenu/side_menu.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
      refreshListenable: router,
      redirect: router._redirectLogic,
      routes: [
        ShellRoute(
            builder: (context, state, child) {
              return Container(
                color: CustomColors.mainBackground,
                child: Row(
                  children: [const SideMenu(), Expanded(flex: 5, child: child)],
                ),
              );
            },
            routes: _routes)
      ]);
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen(
      appStateProvider.select((value) => Object.hashAll([
            value.isLoggedIn,
            value.shouldUpdateStudentIdNumber,
            value.sentAgreement
          ])),
      (_, __) {
        notifyListeners();
      },
    );
  }
  final Ref _ref;

  FutureOr<String?> _redirectLogic(BuildContext context, GoRouterState state) {
    final appState = _ref.read(appStateProvider);
    if (appState.sentAgreement) {
      return '/outboarding';
    } else if (appState.isLoggedIn && appState.shouldUpdateStudentIdNumber) {
      return '/updateStudentId';
    } else if (!appState.isLoggedIn) {
      return '/login';
    } else {
      return '/';
    }
  }
}

final _routes = <GoRoute>[..._loginRoutes, ..._mainRoutes];

final _loginRoutes = [
  GoRoute(
    path: '/login',
    pageBuilder: (context, state) {
      return wrapWithPage(context, state, const LoginWidget());
    },
  )
];

final _mainRoutes = [
  GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return wrapWithPage(context, state, EmployeeFormWidget());
      }),
  GoRoute(
      path: '/updateStudentId',
      pageBuilder: (context, state) {
        return wrapWithPage(context, state, UpdateStudentIdWidget());
      }),
  GoRoute(
      path: '/outboarding',
      pageBuilder: (context, state) {
        return wrapWithPage(context, state, const AgreementSentWidget());
      }),
];

Page wrapWithPage(
    BuildContext buildContext, GoRouterState state, Widget widget) {
  if (!kIsWeb) {
    return MaterialPage(key: state.pageKey, child: widget);
  }
  return NoTransitionPage(child: widget);
}
