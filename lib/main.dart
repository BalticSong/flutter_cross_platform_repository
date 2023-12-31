import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/core/navigation_service.dart';
import 'package:flutter_cross_platform_poc/presentation/viewmodel/login_viewmodel.dart';
import 'package:flutter_cross_platform_poc/presentation/viewmodel/profile_viewmodel.dart';
import 'package:flutter_cross_platform_poc/presentation/viewmodel/video_player_view_model.dart';
import 'package:flutter_cross_platform_poc/utils/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'presentation/view/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context)?.load();
    return MultiProvider(
        providers: [
          Provider<NavigationService>(
            create: (_) => NavigationService(),
          ),

          ChangeNotifierProvider<LoginViewModel>(
            create: (context) => LoginViewModel(),
          ),
           ChangeNotifierProvider<ProfileViewModel>(
            create: (context) => ProfileViewModel(),
          ),
          ChangeNotifierProvider<VideoPlayerViewModel>(
            create: (context) => VideoPlayerViewModel(),
          ),


        ],

    child: MaterialApp(

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('de', 'de'), // French
        // Add more locales here for additional languages
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        return locale;
      },
      title: 'Audio Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    ));
  }
}
