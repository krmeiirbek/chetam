import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import '../services/services.dart';
import '../values/values.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  bool isFirstOpen = false;
  bool isCallVoice = false;
  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';
  bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  Locale locale = const Locale('en', 'US');
  List<Locale> languages = [
    const Locale('en', 'US'),
    const Locale('kz', 'KZ'),
  ];


  @override
  void onInit() {
    super.onInit();
  ///  isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(storageDeviceFirstOpenKey, true);
  }

  void onInitLocale() {
    var langCode = StorageService.to.getString(storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = languages.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = languages[index];
  }

  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    StorageService.to.setString(storageLanguageCode, value.languageCode);
  }
}
