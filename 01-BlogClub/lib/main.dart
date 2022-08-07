import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  Locale _locale = Locale('fa');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        debugShowCheckedModeBanner: false,
        theme: _themeMode == ThemeMode.dark
            ? MyAppThemeConfig.dark().getTheme(_locale.languageCode)
            : MyAppThemeConfig.light().getTheme(_locale.languageCode),
        home: MyHomePage(changeThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark)
              _themeMode = ThemeMode.light;
            else
              _themeMode = ThemeMode.dark;
          });
        }, changeLanguageType: (languageType) {
          setState(() {
            _locale =
                languageType == LanguageType.EN ? Locale('en') : Locale('fa');
          });
        }));
  }
}

class MyAppThemeConfig {
  String faPrimaryFontFamily = 'IranYekan';
  Brightness brightness;
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color scaffoldBackgroundColor;
  final Color appbarColor;

  MyAppThemeConfig.dark()
      : brightness = Brightness.dark,
        primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Colors.white.withOpacity(0.05),
        appbarColor = Colors.black,
        scaffoldBackgroundColor = Color.fromARGB(255, 30, 30, 30);

  MyAppThemeConfig.light()
      : brightness = Brightness.light,
        primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Colors.black.withOpacity(0.05),
        appbarColor = Color.fromARGB(255, 235, 235, 235),
        scaffoldBackgroundColor = Colors.white;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
      primarySwatch: Colors.pink,
      primaryColor: primaryColor,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        fillColor: surfaceColor,
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      brightness: brightness,
      appBarTheme: AppBarTheme(
        backgroundColor: appbarColor,
        elevation: 0,
        foregroundColor: primaryTextColor,
      ),
      dividerColor: surfaceColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      textTheme: languageCode == 'fa' ? faPrimaryTextTheme : enPrimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme {
    return GoogleFonts.latoTextTheme(TextTheme(
      bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
      bodyText1: TextStyle(
        fontSize: 13,
        color: secondaryTextColor,
      ),
      headline6:
          TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
      subtitle1: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    ));
  }

  TextTheme get faPrimaryTextTheme {
    return TextTheme(
        bodyText2: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        bodyText1: TextStyle(
            fontSize: 13,
            height: 1.5,
            color: secondaryTextColor,
            fontFamily: faPrimaryFontFamily),
        caption: TextStyle(fontFamily: faPrimaryFontFamily),
        headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        subtitle1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            fontFamily: faPrimaryFontFamily),
        button: TextStyle(fontFamily: faPrimaryFontFamily));
  }
}

class MyHomePage extends StatefulWidget {
  final Function() changeThemeMode;
  final Function(LanguageType languageType) changeLanguageType;

  MyHomePage({required this.changeThemeMode, required this.changeLanguageType});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SkillType _skillType = SkillType.Photoshop;
  LanguageType _languageType = LanguageType.FA;

  void updateSelectSkill(SkillType skillType) {
    setState(
      () {
        this._skillType = skillType;
      },
    );
  }

  void updateSelectLanguage(LanguageType languageType) {
    widget.changeLanguageType(languageType);
    setState(
      () {
        this._languageType = languageType;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalization.profileTitle,
        ),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: InkWell(
              onTap: widget.changeThemeMode,
              child: Icon(
                CupertinoIcons.ellipsis_vertical,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalization.name,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(AppLocalizations.of(context)!.job),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              size: 14,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text(
                              appLocalization.location,
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                appLocalization.summary,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(appLocalization.selectedLanguage),
                  CupertinoSlidingSegmentedControl<LanguageType>(
                    groupValue: _languageType,
                    children: {
                      LanguageType.EN: Text(
                        appLocalization.enLanguage,
                        style: TextStyle(fontSize: 14),
                      ),
                      LanguageType.FA: Text(
                        appLocalization.faLanguage,
                        style: TextStyle(fontSize: 14),
                      )
                    },
                    onValueChanged: (value) {
                      if (value != null) updateSelectLanguage(value);
                    },
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    appLocalization.skills,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                    ),
                    child: Icon(
                      CupertinoIcons.chevron_down,
                      size: 10,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Center(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  direction: Axis.horizontal,
                  children: [
                    SkillItem(
                      imagePath: 'assets/images/app_icon_01.png',
                      title: 'Photoshop',
                      isSelected: _skillType == SkillType.Photoshop,
                      shadowColor: Colors.blue,
                      type: SkillType.Photoshop,
                      onTap: () => updateSelectSkill(SkillType.Photoshop),
                    ),
                    SkillItem(
                      imagePath: 'assets/images/app_icon_05.png',
                      title: 'Adobe XD',
                      isSelected: _skillType == SkillType.XD,
                      shadowColor: Colors.pink,
                      type: SkillType.XD,
                      onTap: () => updateSelectSkill(SkillType.XD),
                    ),
                    SkillItem(
                      imagePath: 'assets/images/app_icon_04.png',
                      title: 'Illustrator',
                      isSelected: _skillType == SkillType.Illustrator,
                      shadowColor: Colors.orange,
                      type: SkillType.Illustrator,
                      onTap: () => updateSelectSkill(SkillType.Illustrator),
                    ),
                    SkillItem(
                      imagePath: 'assets/images/app_icon_03.png',
                      title: 'After Effect',
                      isSelected: _skillType == SkillType.AfterEffect,
                      shadowColor: Colors.blue.shade800,
                      type: SkillType.AfterEffect,
                      onTap: () => updateSelectSkill(SkillType.AfterEffect),
                    ),
                    SkillItem(
                      imagePath: 'assets/images/app_icon_02.png',
                      title: 'Lightroom',
                      isSelected: _skillType == SkillType.Lightroom,
                      shadowColor: Colors.blue,
                      type: SkillType.Lightroom,
                      onTap: () => updateSelectSkill(SkillType.Lightroom),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalization.personalInformation,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                        labelText: appLocalization.email,
                        prefixIcon: Icon(CupertinoIcons.at)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                        labelText: appLocalization.password,
                        prefixIcon: Icon(CupertinoIcons.lock)),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(appLocalization.save),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isSelected;
  final Function() onTap;

  SkillItem(
      {required this.title,
      required this.imagePath,
      required this.shadowColor,
      required this.isSelected,
      required this.type,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).dividerColor,
                boxShadow: [])
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
              decoration: isSelected
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.5),
                          blurRadius: 20.0,
                        )
                      ],
                    )
                  : null,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
            )
          ],
        ),
      ),
    );
  }
}

enum SkillType { Photoshop, XD, Illustrator, AfterEffect, Lightroom }

enum LanguageType { FA, EN }
