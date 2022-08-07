import 'dart:ui';

import 'package:advance_ui_sevenlearn/gen/assets.gen.dart';
import 'package:advance_ui_sevenlearn/story/controller/story_controller.dart';
import 'package:advance_ui_sevenlearn/story/utils.dart';
import 'package:advance_ui_sevenlearn/story/widgets/story_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final StoryController controller = StoryController();
  static const Duration defaultDuration = Duration(seconds: 5);
  List<StoryItem> storyItems = [
    StoryItem(const StoryItemView(), duration: defaultDuration),
    StoryItem(const StoryItemView(), duration: defaultDuration),
    StoryItem(const StoryItemView(), duration: defaultDuration),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom, // Shows Status bar and hides Navigation bar
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff376AED),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [
            SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
            SystemUiOverlay.bottom, // Shows Status bar and hides Navigation bar
          ],
        );
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
              systemNavigationBarColor: themeData.colorScheme.background,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: themeData.colorScheme.background),
        );
        return false;
      },
      child: StoryView(
        storyItems: storyItems,
        margin: const EdgeInsets.only(top: 16, left: 26, right: 26, bottom: 32),
        controller: controller,
        onComplete: () {
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: [
              SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
              SystemUiOverlay
                  .bottom, // Shows Status bar and hides Navigation bar
            ],
          );
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
                systemNavigationBarColor: themeData.colorScheme.background,
                systemNavigationBarIconBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: themeData.colorScheme.background),
          );
          Navigator.pop(context);
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [
                SystemUiOverlay
                    .top, // Shows Status bar and hides Navigation bar
                SystemUiOverlay
                    .bottom, // Shows Status bar and hides Navigation bar
              ],
            );
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                  systemNavigationBarColor: themeData.colorScheme.background,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: themeData.colorScheme.background),
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

class StoryItemView extends StatelessWidget {
  const StoryItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ColoredBox(
      color: themeData.colorScheme.primary,
      child: Column(
        children: [
          Flexible(
            flex: 85,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Assets.img.storyContent.image(
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned.fill(
                          child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.58),
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0.27),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(32),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Positioned(
                  left: 40,
                  bottom: 40,
                  right: 40,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10,
                              sigmaY: 10,
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            children: [
                              Text(
                                'Do You Want To Live A Happy Life? Smile.',
                                style: themeData.textTheme.headline6!
                                    .apply(color: Colors.white),
                              ),
                              SizedBox(
                                height: 16,
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10)),
                              ),
                              Text(
                                'Sometimes there’s no reason to smile, but '
                                'I’ll smile anyway because of life. Yes,'
                                ' I’m one of those people who always smiles.',
                                style: themeData.textTheme.subtitle2!.apply(
                                  color: const Color(0xffEBEAEA),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 52,
                  right: 40,
                  left: 40,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Assets.img.stories.story4.image(
                          width: 54,
                          height: 54,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jasmine Levin',
                              style: themeData.textTheme.headline6!.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '4m ago',
                              style: themeData.textTheme.bodyText2!
                                  .apply(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 32,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 15,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox.shrink(),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Assets.img.icons.arrow.svg(),
                            const SizedBox(
                              height: 4,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle:
                                    themeData.textTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: themeData.colorScheme.primary,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 11,
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text('Read More'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            const Icon(
                              CupertinoIcons.heart_fill,
                              color: Color(0xffFF3743),
                              size: 32,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '450K',
                              style: themeData.textTheme.headline6!.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
