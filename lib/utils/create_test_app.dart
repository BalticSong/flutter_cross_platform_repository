import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/presentation/view/default_page.dart';
import 'package:flutter_cross_platform_poc/utils/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


Widget createTestApp({
  Widget? child,
  List<NavigatorObserver>? navigatorObservers,
  Map<String, WidgetBuilder>? routes,
}) {


  return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      home: Scaffold(
        body: child,
      ),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => DefaultPage());
      },

      routes: routes ?? {},
      navigatorObservers: navigatorObservers ?? []);
}
