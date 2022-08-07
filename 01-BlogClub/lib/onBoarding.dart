import 'package:advance_ui_sevenlearn/auth.dart';
import 'package:advance_ui_sevenlearn/data.dart';
import 'package:advance_ui_sevenlearn/gen/assets.gen.dart';
import 'package:advance_ui_sevenlearn/home.dart';
import 'package:advance_ui_sevenlearn/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int page = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (page != _pageController.page!.round()) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final onBoardingItems = AppData.onBoardings;
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  bottom: 8,
                ),
                child:
                    Assets.img.background.onboarding.image(fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 270,
              decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), blurRadius: 20)
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: onBoardingItems.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                onBoardingItems[index].title,
                                style: themeData.textTheme.headline4,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                onBoardingItems[index].desc,
                                style: themeData.textTheme.subtitle1
                                    ?.apply(fontSizeFactor: 0.9),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 60,
                    margin:
                        const EdgeInsets.only(left: 32, right: 32, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: onBoardingItems.length,
                          axisDirection: Axis.horizontal,
                          effect: ExpandingDotsEffect(
                            activeDotColor: themeData.colorScheme.primary,
                            dotColor:
                                themeData.colorScheme.primary.withOpacity(0.1),
                            dotWidth: 8,
                            dotHeight: 8,
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(88, 60)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)))),
                            onPressed: () {
                              if (page == onBoardingItems.length - 1) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthPage()));
                              } else {
                                _pageController.animateToPage(page + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              }
                            },
                            child: Icon(page != onBoardingItems.length - 1
                                ? CupertinoIcons.arrow_right
                                : CupertinoIcons.check_mark))
                      ],
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
