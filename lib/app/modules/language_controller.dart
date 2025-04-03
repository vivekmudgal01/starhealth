import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLocale = Locale('en', 'US').obs;
  Map<String, String> translations = {};

  @override
  void onInit() {
    loadLanguage(selectedLocale.value.languageCode);
    super.onInit();
  }

  void loadLanguage(String langCode) async {
    String jsonString =
        await rootBundle.loadString('assets/lang/$langCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    translations = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    selectedLocale.value = Locale(langCode, langCode == 'en' ? 'US' : 'IN');
    update();
  }

  void toggleLanguage() {
    String newLang = selectedLocale.value.languageCode == 'en' ? 'hi' : 'en';
    loadLanguage(newLang);
    Get.updateLocale(selectedLocale.value);
  }
}
