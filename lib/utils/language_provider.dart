import 'package:flutter/material.dart';
import 'package:flutter_android_ios/utils/app_localizations.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('en');

  Locale get currentLocale => _currentLocale;

  void updateLanguage(Locale newLocale) {
    _currentLocale = newLocale;
    AppLocalizations().load();
    notifyListeners();
  }
}
