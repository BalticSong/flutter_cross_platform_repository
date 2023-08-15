import 'package:flutter/material.dart';
import 'package:flutter_android_ios/data/remote/model/song_model.dart';
import 'package:flutter_android_ios/data/remote/model/user_model.dart';
import 'package:flutter_android_ios/presentation/view/vertical_songs_list.dart';
import 'package:flutter_android_ios/utils/app_localizations.dart';
import 'package:flutter_android_ios/utils/app_theme.dart';
import 'package:flutter_android_ios/utils/custom_tab_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const route = 'profile_screen';
  final UserModel? userProfile;

  ProfileScreen({required this.userProfile});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabController2;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);

    super.initState();
  }

  final playList = [
    SongModel('Art Techno', 'Likes: 100'),
    SongModel('Workout', 'Likes: 600'),
    SongModel('Quite Hours', 'Likes: 101'),
    SongModel('Deep Focus', 'Likes: 93'),
  ];

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context) => AppLocalizations(),
        builder: (context, provider) {
          final appLocalization = AppLocalizations.of(context);
          return FutureBuilder<Locale>(
              future: appLocalization?.loadLocale(),
              builder: (context, snapshot) {
              return   Consumer<AppLocalizations>(
                    builder: (context, provider, child) {
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        title: const Text('TabBar Widget'),
                        actions: [
                          PopupMenuButton(
                            onSelected: (Locale selectedLocale) {
                              provider.saveLocale(selectedLocale.languageCode);


                            },
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: Locale('en', 'US'),
                                  child: Text('English'),
                                ),
                                PopupMenuItem(
                                  value: Locale('de', 'DE'),
                                  child: Text('German'),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                      bottomNavigationBar: DefaultTabController(
                        child: CustomTabBar(),
                        length: 4,
                      ),
                      body: SingleChildScrollView(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              key:  Key('column'),
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(children: [
                                  const SizedBox(
                                      height: AppTheme.SIZEBOX_HEIGHT_xSMALL),
                                  CircleAvatar(
                                    key: const Key('user_image'),
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        widget.userProfile?.image ?? ""),
                                  ),
                                  const SizedBox(
                                      height: AppTheme.SIZEBOX_HEIGHT_xxSMALL),
                                  Text(widget.userProfile?.firstName ?? ""),
                                  OutlinedButton(
                                    key: const Key('button-profile-edit'),
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // Set border radius here
                                      ),
                                      side: BorderSide(
                                          color: Colors
                                              .black), // Set border color here
                                    ),
                                    child: Text(
                                        provider.translate('edit') ?? 'Edit',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                  SizedBox(
                                      height: AppTheme.SIZEBOX_HEIGHT_xxSMALL),
                                  Row(
                                    key: Key('Row_profile_followers'),
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Spacer(),
                                      Text(
                                          '20 ${provider.translate('following') ?? 'Following'}'),
                                      SizedBox(width: 5),
                                      Text(' \u2981'),
                                      SizedBox(width: 5),
                                      Text(
                                          '20 ${provider.translate('followers') ?? 'Followers'}'),
                                      Spacer(),
                                    ],
                                  ),
                                ]),
                                TabBar(
                                  key: Key('profile_tabbar'),
                                  unselectedLabelColor: Colors.black,
                                  labelColor: Colors.red,
                                  tabs: [
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              provider.translate('playlists') ??
                                                  'Playlists',
                                              style:
                                                  AppTheme.HEADER_TITLE_STYLE,
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              provider.translate('downloads') ??
                                                  'Downloads',
                                              style:
                                                  AppTheme.HEADER_TITLE_STYLE,
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              provider.translate('likes') ??
                                                  'Likes',
                                              style:
                                                  AppTheme.HEADER_TITLE_STYLE,
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  controller: _tabController,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _tabController2,
                                    children: <Widget>[
                                      VerticalSongsList(songList: playList),
                                      Center(child: Text('Downloads Content')),
                                      Center(child: Text('Likes Content')),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                });
              });
        });
  }

  Future<Locale> _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedLocale = prefs.getString('locale');
    // Return the selected locale or a default locale
    return Locale(storedLocale ?? 'en', ''); // Replace with your default locale
  }
}
