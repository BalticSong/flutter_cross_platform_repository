import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizations extends ChangeNotifier {
  Locale? _currentLocale;
   Map<String, String>? _localisedString;
  AppLocalizations(){
    load();
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationDelagate();
  Locale? get currentLocale => _currentLocale;

  void updateLanguage(Locale newLocale) {
    _currentLocale = newLocale;
    load();
    notifyListeners();
  }
  static AppLocalizations? of(context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);



  Future<void> load() async {
    Locale getLocale= await loadLocale();
    _currentLocale=getLocale;
    final jsonString = await rootBundle
        .loadString('assets/l10n/app_${currentLocale!.languageCode}.arb');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localisedString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

  }
  void saveLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', locale);
    updateLanguage(Locale(locale));
  }
  Future<Locale> loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedLocale = prefs.getString('locale');

    // Return the selected locale or a default locale
    if (storedLocale != null) {
      return Locale(storedLocale, ''); // Update with your default country code
    } else {
      return Locale('en', ''); // Replace with your default locale
    }
  }
  String? translate(String key) {
    return _localisedString?[key];
  }
}

class _AppLocalizationDelagate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelagate();

  @override
  bool isSupported(Locale locale) {
    return Languages.languages
        .map((e) => e.code)
        .toList()
        .contains(locale.languageCode);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
    return false;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {

    AppLocalizations appLocalizations = AppLocalizations();
    await appLocalizations.load();
    return appLocalizations;
  }

}

class LanguageEntity {
  final String code;
  final String value;

  const LanguageEntity({
    required this.code,
    required this.value,
  });
}

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'de', value: 'German'),
  ];
}
