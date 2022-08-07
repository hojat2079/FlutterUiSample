import 'package:advance_ui_sevenlearn/article.dart';
import 'package:advance_ui_sevenlearn/home.dart';
import 'package:advance_ui_sevenlearn/profile.dart';
import 'package:advance_ui_sevenlearn/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static String defaultFontFamily = 'Avenir';

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Color(0xFF0D253C);
    const Color secondaryTextColor = Color(0xFF2D4379);
    const Color primaryColor = Color(0xff376AED);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          titleSpacing: 32,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.light(
            primary: primaryColor,
            surface: Colors.white,
            onSurface: primaryTextColor,
            onSecondary: secondaryTextColor,
            onPrimary: Colors.white,
            background: Color(0xfffbfcff),
            onBackground: Colors.black),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                  fontSize: 14,
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
            backgroundColor: primaryColor,
            contentTextStyle: TextStyle(color: Colors.white)),
        textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: primaryTextColor,
            ),
            headline5: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: primaryTextColor),
            headline4: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
                fontSize: 24),
            subtitle1: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondaryTextColor,
              fontWeight: FontWeight.w200,
              fontSize: 18,
            ),
            subtitle2: TextStyle(
              fontFamily: defaultFontFamily,
              color: primaryTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            bodyText1: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.w400,
              color: primaryTextColor,
              fontSize: 14,
            ),
            bodyText2: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondaryTextColor,
              fontSize: 12,
            ),
            caption: TextStyle(
                fontFamily: defaultFontFamily,
                color: const Color(0xff7B8BB2),
                fontSize: 10,
                fontWeight: FontWeight.w800)),
      ),
      home: const HomePage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndexPage = homePageIndex;
  bool lastPageIsSelected = false;
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _menuKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();

  final List<int> _history = [];

  late final keyMap = {
    homePageIndex: _homeKey,
    articlePageIndex: _articleKey,
    searchPageIndex: _searchKey,
    menuPageIndex: _menuKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectNavigatorState =
        keyMap[selectedIndexPage]!.currentState!;
    if (currentSelectNavigatorState.canPop()) {
      currentSelectNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedIndexPage = _history.last;
        _history.removeLast();
      });
      return false;
    } else if (_history.isEmpty &&
        !lastPageIsSelected &&
        selectedIndexPage != homePageIndex) {
      setState(() {
        selectedIndexPage = homePageIndex;
        lastPageIsSelected = true;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: 65,
              child: IndexedStack(
                index: selectedIndexPage,
                children: [
                  _navigatorItem(_homeKey, homePageIndex, const HomePage()),
                  _navigatorItem(
                      _articleKey, articlePageIndex, const ArticlePage()),
                  _navigatorItem(
                      _searchKey, searchPageIndex, const SearchPage()),
                  _navigatorItem(_menuKey, menuPageIndex, const ProfilePage()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigationView(
                onTab: (int index) {
                  if (index != selectedIndexPage) {
                    setState(() {
                      _history.remove(selectedIndexPage);
                      _history.remove(index);
                      _history.add(selectedIndexPage);
                      selectedIndexPage = index;
                    });
                  }
                },
                selectIndexPage: selectedIndexPage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigatorItem(GlobalKey key, int index, Widget child) {
    return key.currentState == null && index != selectedIndexPage
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (setting) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedIndexPage != index, child: child)),
          );
  }
}

const homePageIndex = 0;
const articlePageIndex = 1;
const searchPageIndex = 2;
const menuPageIndex = 3;

class _BottomNavigationView extends StatelessWidget {
  const _BottomNavigationView({
    Key? key,
    required this.onTab,
    required this.selectIndexPage,
  }) : super(key: key);
  final Function(int index) onTab;
  final int selectIndexPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: const Color(0xff9b8487).withOpacity(0.3)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _BottomNavigationViewItem(
                        title: 'Home',
                        iconFileName: 'home.png',
                        isActive: selectIndexPage == homePageIndex,
                        onTap: () {
                          onTab(homePageIndex);
                        },
                        actionIconFileName: 'home_active.png'),
                    _BottomNavigationViewItem(
                        title: 'Article',
                        iconFileName: 'article.png',
                        isActive: selectIndexPage == articlePageIndex,
                        onTap: () {
                          onTab(articlePageIndex);
                        },
                        actionIconFileName: 'article_active.png'),
                    const Expanded(child: SizedBox()),
                    _BottomNavigationViewItem(
                        title: 'Search',
                        iconFileName: 'search.png',
                        onTap: () {
                          onTab(searchPageIndex);
                        },
                        isActive: selectIndexPage == searchPageIndex,
                        actionIconFileName: 'search_active.png'),
                    _BottomNavigationViewItem(
                        title: 'Menu',
                        onTap: () {
                          onTab(menuPageIndex);
                        },
                        isActive: selectIndexPage == menuPageIndex,
                        iconFileName: 'menu.png',
                        actionIconFileName: 'menu_active.png')
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              width: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32.5),
              ),
              child: Container(
                margin: const EdgeInsets.all(4),
                height: 57,
                width: 57,
                decoration: BoxDecoration(
                  color: const Color(0xff376AED),
                  borderRadius: BorderRadius.circular(32.5),
                ),
                child: const Icon(
                  CupertinoIcons.add,
                  color: Color(0xFF8FE6FF),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationViewItem extends StatelessWidget {
  const _BottomNavigationViewItem(
      {Key? key,
      required this.title,
      required this.iconFileName,
      required this.actionIconFileName,
      required this.isActive,
      required this.onTap})
      : super(key: key);
  final String title;
  final String iconFileName;
  final String actionIconFileName;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? actionIconFileName : iconFileName}',
              height: 24,
              width: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themeData.textTheme.caption!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.caption!.color),
            )
          ],
        ),
      ),
    );
  }
}
