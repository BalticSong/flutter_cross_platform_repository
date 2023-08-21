import 'package:flutter/material.dart';
import 'package:flutter_cross_platform_poc/data/remote/model/user_model.dart';
import 'package:flutter_cross_platform_poc/presentation/view/Profile.dart';
import 'package:flutter_cross_platform_poc/presentation/view/default_page.dart';
import 'package:flutter_cross_platform_poc/presentation/view/video_view.dart';
import 'package:flutter_cross_platform_poc/utils/app_localizations.dart';
import 'package:flutter_cross_platform_poc/utils/custom_tab_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final UserModel? userProfile;

  HomePage(this.userProfile);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context);

    return ChangeNotifierProvider(
        create: (context) => appLocalization,
        builder: (context, provider) {
          return FutureBuilder<Locale>(
              // Load the stored locale when the app starts
              future: appLocalization?.loadLocale(),
              builder: (context, snapshot) {
                return SafeArea(
                  child: DefaultTabController(
                      length: 4, // Number of tabs
                      child: Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          title: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Good Aftternoon!',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                          actions: <Widget>[
                            InkWell(
                              key: Key('profile_button'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen(
                                          userProfile: widget.userProfile)),
                                ).then((value) {
                                  setState(() {});
                                });
                              },
                              child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 8, 10, 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.orange,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        widget.userProfile?.image ?? ""),
                                  )),
                            ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                        body: TabBarView(
                          controller: _tabController,
                          children: [
                            VideosView(),
                            const DefaultPage(),
                            const DefaultPage(),
                            const DefaultPage(),
                          ],
                        ),
                        bottomNavigationBar: CustomTabBar(),
                      )),
                );
              });
        });
  }
}
