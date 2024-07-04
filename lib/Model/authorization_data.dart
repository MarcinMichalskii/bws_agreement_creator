import 'package:copy_with_extension/copy_with_extension.dart';

part 'authorization_data.g.dart';

@CopyWith()
class AuthorizationData {
  final String accessToken;
  final String refreshToken;

  AuthorizationData({required this.accessToken, required this.refreshToken});

  factory AuthorizationData.fromJson(Map<String, dynamic> json) {
    return AuthorizationData(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
