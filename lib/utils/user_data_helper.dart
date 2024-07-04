import 'package:bws_agreement_creator/Model/authorization_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUserData {
  const StorageUserData({
    required this.accessToken,
    required this.refreshToken,
  });
  final String accessToken;
  final String refreshToken;
}

class UserDataHelper {
  final storage = const FlutterSecureStorage();

  Future<void> cleanupUserData() async {
    await storage.write(key: 'accessToken', value: null);
    await storage.write(key: 'refreshToken', value: null);
  }

  Future<void> storeTokens(AuthorizationData data) async {
    await storage.write(key: 'accessToken', value: data.accessToken);
    await storage.write(key: 'refreshToken', value: data.refreshToken);
  }

  Future<StorageUserData> readUserData() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    return StorageUserData(
        accessToken: accessToken ?? '', refreshToken: refreshToken ?? '');
  }

  Future<void> save(String key, String? value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> getAccessToken() async {
    return storage.read(key: 'accessToken');
  }

  Future<String?> getRefreshToken() async {
    return storage.read(key: 'refreshToken');
  }

  Future<void> markAgreementPopup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('SeenAgreementPopup', true);
  }

  Future<void> markTrainingsPopup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('SeenTrainingsPopup', true);
  }

  Future<bool> seenAgreementPopup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('SeenAgreementPopup') ?? false;
  }

  Future<bool> seenTrainingsPopup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('SeenTrainingsPopup') ?? false;
  }
}
