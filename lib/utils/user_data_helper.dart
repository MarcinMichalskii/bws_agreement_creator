import 'dart:convert';

import 'package:bws_agreement_creator/Model/authorization_data.dart';
import 'package:bws_agreement_creator/Model/raport_generator_data.dart';
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('GenerateRaportData');
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
    try {
      return await storage.read(key: 'accessToken');
    } catch (e) {
      return null;
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      return await storage.read(key: 'refreshToken');
    } catch (e) {
      return null;
    }
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

  Future<void> storeGenerateRaportData(RaportGeneratorData? data) async {
    if (data == null) {
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(data.toJson());

    await prefs.setString('GenerateRaportData', jsonString);
  }

  Future<RaportGeneratorData> getGenerateRaportData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString('GenerateRaportData');

    if (jsonString == null) {
      return RaportGeneratorData();
    }

    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return RaportGeneratorData.fromJson(jsonMap);
  }
}
