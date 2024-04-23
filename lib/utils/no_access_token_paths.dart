import 'package:bws_agreement_creator/utils/base_url.dart';

class NoAccessTokenPaths {
  static const List<String> paths = [
    '$baseUrl/refreshToken',
    '$baseUrl/login',
    '$baseUrl/loginWithGoogle'
  ];
}
