import 'package:copy_with_extension/copy_with_extension.dart';

part 'authorization_data.g.dart';

@CopyWith()
class AuthorizationData {
  final String cookie;

  AuthorizationData({required this.cookie});

  factory AuthorizationData.fromJson(Map<String, dynamic> json) {
    return AuthorizationData(
      cookie: json['cookie'],
    );
  }
}
