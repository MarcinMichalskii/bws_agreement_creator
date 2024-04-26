import 'dart:async';

import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Outboarding/agreement_sent_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/update_student_id_widget.dart';
import 'package:bws_agreement_creator/Widgets/Login/login_widget.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_trainings_scaffold.dart';
import 'package:bws_agreement_creator/Widgets/SideMenu/side_menu.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
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
                  children: [
                    if (kIsWeb) const SideMenu(),
                    Expanded(flex: 5, child: child)
                  ],
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
          ])),
      (_, __) {
        notifyListeners();
      },
    );
  }
  final Ref _ref;

  FutureOr<String?> _redirectLogic(BuildContext context, GoRouterState state) {
    final appState = _ref.read(appStateProvider);

    if (!appState.isLoggedIn) {
      return '/login';
    } else if (appState.isLoggedIn && state.fullPath == '/login' ||
        state.fullPath == '/updateStudentId') {
      return appState.shouldUpdateStudentIdNumber
          ? '/updateStudentId'
          : '/employeeFormWidget';
    }
    return null;
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
      path: '/employeeFormWidget',
      name: 'employeeFormWidget',
      pageBuilder: (context, state) {
        return wrapWithPage(context, state, EmployeeFormWidget());
      }),
  GoRoute(
      path: '/updateStudentId',
      name: 'updateStudentId',
      pageBuilder: (context, state) {
        return wrapWithPage(context, state, UpdateStudentIdWidget());
      }),
  GoRoute(
      path: '/outboarding',
      name: 'outboarding',
      pageBuilder: (context, state) {
        return wrapWithPage(context, state, const AgreementSentWidget());
      }),
  GoRoute(
      path: '/manageTrainings',
      name: 'manageTrainings',
      pageBuilder: (context, state) =>
          wrapWithPage(context, state, const ManageTraingsScaffold()))
];

Page wrapWithPage(
    BuildContext buildContext, GoRouterState state, Widget widget) {
  if (!kIsWeb &&
      !(state.fullPath != '/login') &&
      !(state.fullPath != '/employeeFormWidget')) {
    return MaterialPage(key: state.pageKey, child: widget);
  }
  return NoTransitionPage(child: widget);
}

extension RouterHelper on BuildContext {
  void pushScreen(
    String screen, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      GoRouter.of(this).pushNamed(
        screen,
        pathParameters: params,
        queryParameters: queryParams,
        extra: extra,
      );
}
