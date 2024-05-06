// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "title": "Queue Pro",
  "welcome": "Hello",
  "language": "Language",
  "skip": "Skip",
  "next": "Next"
};
static const Map<String,dynamic> my = {
  "title": "Queue Pro",
  "welcome": "ပြည်တောင်စုနယ်မြေ",
  "language": "Language",
  "skip": "ကျော်ပါ",
  "next": "ဆက်သွားပါ"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "my": my};
}