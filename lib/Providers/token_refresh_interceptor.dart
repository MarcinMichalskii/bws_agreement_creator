import 'dart:async';

import 'package:bws_agreement_creator/Model/authorization_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/no_access_token_paths.dart';
import 'package:bws_agreement_creator/utils/user_data_helper.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jwt_decode/jwt_decode.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor(this.read);
  final Reader read;
  bool isRefreshing = false;
  late Completer<void> completer;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await UserDataHelper().getAccessToken() ?? '';

    if (NoAccessTokenPaths.paths.contains(options.path)) {
      handler.next(options);
      return;
    }

    if (accessToken.isEmpty) {
      handler.next(options);
      return;
    }

    final tokenExpired = await isTokenExpired();
    if (!tokenExpired) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      handler.next(options);
      return;
    }

    completer = Completer<void>();
    if (isRefreshing) {
      await completer.future;
      handler.next(options);
      return;
    }

    final newToken = await refreshToken();
    if (newToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $newToken';
      handler.next(options);
    } else {
      logout();
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      logout();
    }
    handler.next(response);
  }

  Future<bool> isTokenExpired() async {
    final accessToken = await UserDataHelper().getAccessToken();
    if (accessToken == null) {
      return true;
    }

    final currentDate = DateTime.now();
    final expiryDate = Jwt.getExpiryDate(accessToken);
    final timeToExpire = expiryDate?.difference(currentDate).inSeconds;
    const timeToRefresh = 50;
    return (timeToExpire != null && timeToExpire < timeToRefresh);
  }

  Future<String> refreshToken() async {
    final controller = ApiController(AuthorizationData.fromJson);
    final refreshToken = await UserDataHelper().getRefreshToken();
    final response = await controller.performPost(
        params: {'refreshToken': refreshToken ?? ''},
        url: '$baseUrl/refreshToken');
    if (response.error == null) {
      final data = response.data;
      await UserDataHelper().storeTokens(data!);
      read(authProvider.notifier).state = response;
      return data.accessToken;
    }
    return '';
  }

  void logout() {
    UserDataHelper().cleanupUserData();
    read(appStateProvider.notifier).setDefaultState();
    read(notAStudentTapped.notifier).state = false;
    read(profileProvider.notifier).setDefaultState();
  }
}
