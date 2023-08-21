
import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/utils/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppLocalizations', () {



    testWidgets('AppLocalizations should provide localizations', (WidgetTester tester) async {
      final appLocalizations = AppLocalizations();

      final widget = Builder(
        builder: (BuildContext context) {
          final localizedString = appLocalizations.translate('app_title');
          return Text(localizedString ?? 'Not found');
        },
      );

      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: [AppLocalizations.delegate],
        locale: Locale('en', ''),
        supportedLocales: Languages.languages.map((e) => Locale(e.code, '')),
        home: widget,
      ));


      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: [AppLocalizations.delegate],
        locale: Locale('en', ''),
        supportedLocales: Languages.languages.map((e) => Locale(e.code, '')),
        home: Builder(
          builder: (BuildContext context) {
            final localizedString = appLocalizations.translate('app_title');
            return Text(localizedString ?? 'Not found');
          },
        ),
      ));

    });
  });
}
