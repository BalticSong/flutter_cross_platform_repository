// login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/presentation/view/home_page.dart';
import 'package:flutter_cross_platform_poc/presentation/viewmodel/login_viewmodel.dart';
import 'package:flutter_cross_platform_poc/utils/app_localizations.dart';
import 'package:flutter_cross_platform_poc/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  static const route = 'loginPage';
  final loginViewModel = LoginViewModel();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context);
    _emailController.text = 'kminchelle';
    _passwordController.text = '0lelplR';
    return FutureBuilder<Locale>(
      // Load the stored locale when the app starts
        future: _loadLocale(appLocalization),
        builder: (context, snapshot) {
          return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppTheme.PAGE_PADDING,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                        ),
                        FlutterLogo(
                          size: 100,
                        ),
                        SizedBox(height: AppTheme.SIZEBOX_HEIGHT_SMALL),
                        Text(
                          appLocalization?.translate('vodcatalog') ?? '',
                          style: AppTheme.HEADER_TITLE_STYLE,
                        ),
                        SizedBox(height: AppTheme.SIZEBOX_HEIGHT_xxSMALL),
                        Text(
                          appLocalization?.translate('login_sub_title') ?? '',
                          style: AppTheme.SUB_HEADER_TITLE_STYLE,
                        ),
                        SizedBox(height: AppTheme.SIZEBOX_HEIGHT_SMALL),
                        TextField(
                          key: Key('textfield_username'),
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText:
                            appLocalization?.translate('username') ?? '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppTheme.SIZEBOX_HEIGHT_xxSMALL),
                        TextField(
                          key: Key('textfield_password'),
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: appLocalization?.translate('password') ??
                                '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: AppTheme.SIZEBOX_HEIGHT_xxSMALL),
                        Align(
                            key: Key('textforgot_password'),
                            alignment: Alignment.centerRight,
                            child: Text(
                              appLocalization?.translate('forgot_password') ??
                                  '', style: AppTheme.NORMAL_TEXT,)),
                        const SizedBox(height: AppTheme.SIZEBOX_HEIGHT_xSMALL),

                        OutlinedButton(
                          key: Key('button_login'),
                          onPressed: () {
                            _login(context);
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                  10), // Set border radius here
                            ),
                            side: BorderSide(
                                color: Colors.black), // Set border color here
                          ),

                          child: Text(appLocalization?.translate('login') ?? '',
                              style: TextStyle(fontSize: 16, color: Colors
                                  .black)),

                        ),
                        const SizedBox(height: AppTheme.SIZEBOX_HEIGHT_xSMALL),
                        Align(
                            key: Key('textSign_up'),
                            alignment: Alignment.center,
                            child: Text(
                              appLocalization?.translate('sign_up') ?? '',
                              style: AppTheme.BOLD_TEXT,)),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  Future<Locale> _loadLocale(AppLocalizations? appLocalization) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedLocale = prefs.getString('locale');
    appLocalization?.load();
    // Return the selected locale or a default locale
    return Locale(storedLocale ?? 'en', ''); // Replace with your default locale
  }

  void _login(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    widget.loginViewModel.loginUser(email, password).then((loggedInUser) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(widget.loginViewModel.loggedInUser)),
      );

      // Handle the logged-in user (navigate to a new page or show a success message)
    }).catchError((error) {
      // Handle the error (show an error message or do something else)
    });
  }
}
