import 'dart:async';

import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Outboarding/agreement_sent_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/update_student_id_widget.dart';
import 'package:bws_agreement_creator/Widgets/Login/login_widget.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapter_details.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/Widgets/SideMenu/side_menu.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/chapter_details_scaffold.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/chapter_examine_scaffold.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/chapters_list_scaffold.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/watch_video_scaffold.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

bool isDekstop(context) {
  print(MediaQuery.of(context).size.width);

  if (kIsWeb) {
    const mobileScreenWidth = 1023.0;
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > mobileScreenWidth;
  } else {
    return false;
  }
}

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
                    if (isDekstop(context)) const SideMenu(),
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
      path: '/trainings',
      name: 'trainings',
      pageBuilder: (context, state) {
        return wrapWithPage(context, state, const ChaptersListScaffold());
      },
      routes: [
        GoRoute(
            path: ':id1',
            name: 'videosList',
            pageBuilder: (context, state) {
              final chapterId = state.pathParameters['id1'] ?? '';
              final chapterName = state.uri.queryParameters['name'] ?? '';
              return wrapWithPage(
                  context,
                  state,
                  ChapterDetailsScaffold(
                    chapterId: chapterId,
                    chapterName: chapterName,
                  ));
            },
            routes: [
              GoRoute(
                  path: 'examine',
                  name: 'examine',
                  pageBuilder: (context, state) {
                    final chapterId = state.pathParameters['id1'] ?? '';
                    final chapterName = state.uri.queryParameters['name'] ?? '';
                    return wrapWithPage(
                        context,
                        state,
                        ChapterExamineScaffold(
                            chapterId: chapterId, chapterName: chapterName));
                  }),
              GoRoute(
                  path: ':id2',
                  name: 'watchVideo',
                  pageBuilder: (context, state) {
                    final videoId = state.pathParameters['id2'] ?? '';
                    final videoTitle = state.uri.queryParameters['title'] ?? '';
                    final videoUrl = state.uri.queryParameters['url'] ?? '';
                    return wrapWithPage(
                        context,
                        state,
                        WatchVideoScaffold(
                          videoUrl: videoUrl,
                          videoTitle: videoTitle,
                          videoId: videoId,
                          chapterId: state.pathParameters['id1'] ?? '',
                        ));
                  }),
            ]),
      ]),
  GoRoute(
      path: '/manageTrainings',
      name: 'manageTrainings',
      routes: [
        GoRoute(
            path: ':id',
            name: 'manageChapterDetails',
            pageBuilder: (context, state) {
              final chapterId = state.pathParameters['id'] ?? '';
              final chapterTitle = state.uri.queryParameters['title'] ?? '';
              return wrapWithPage(
                  context,
                  state,
                  ManageChapterDetailsScaffold(
                      chapterId: chapterId, chapterTitle: chapterTitle));
            }),
      ],
      pageBuilder: (context, state) =>
          wrapWithPage(context, state, const ManageChaptersScaffold()))
];

Page wrapWithPage(
    BuildContext buildContext, GoRouterState state, Widget widget) {
  if (!kIsWeb &&
      !(state.fullPath != '/login') &&
      !(state.fullPath != '/employeeFormWidget')) {
    return MaterialPage(key: state.pageKey, child: widget, name: state.name);
  }
  return NoTransitionPage(child: widget, key: state.pageKey, name: state.name);
}

extension RouterHelper on BuildContext {
  void pushScreen(
    String screen, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      GoRouter.of(this).goNamed(
        screen,
        pathParameters: params,
        queryParameters: queryParams,
        extra: extra,
      );
}
