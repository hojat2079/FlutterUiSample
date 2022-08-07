import 'package:advance_ui_sevenlearn/gen/assets.gen.dart';
import 'package:advance_ui_sevenlearn/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        floatingActionButton: InkWell(
          onTap: () {
            showSnackBar(context, 'on Fab is Clicked');
          },
          child: Container(
            width: 111,
            height: 48,
            decoration: BoxDecoration(
              color: themeData.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: themeData.colorScheme.primary.withOpacity(0.5))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.img.icons.thumbs.svg(),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '2.1k',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontFamily.avenir,
                    fontWeight: FontWeight.w400,
                    color: themeData.colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: themeData.colorScheme.surface,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  // pinned: true,
                  // floating: true,
                  title: Text(
                    'Article',
                    style: themeData.textTheme.headline4,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        showSnackBar(context, 'on More is Clicked');
                      },
                      icon: const Icon(Icons.more_horiz_rounded),
                    ),
                    const SizedBox(
                      width: 16,
                    )
                  ],
                ),
                SliverList(
                    delegate: SliverChildListDelegate.fixed([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
                        child: Text(
                          'Four Things Every Woman Needs To Know',
                          style: themeData.textTheme.headline4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.img.stories.story4.image(
                                  height: 48, width: 48, fit: BoxFit.cover),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Richard Gervain',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: themeData
                                                .colorScheme.onSecondary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '2m ago',
                                    style: themeData.textTheme.bodyText2?.apply(
                                      color: const Color(0xff7B8BB2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                CupertinoIcons.share,
                                color: themeData.colorScheme.primary,
                              ),
                              onPressed: () {
                                showSnackBar(context, 'on Share is Clicked');
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                CupertinoIcons.bookmark,
                                color: themeData.colorScheme.primary,
                              ),
                              onPressed: () {
                                showSnackBar(context, 'on Bookmark is Clicked');
                              },
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        child: Assets.img.background.singlePost.image(),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(32),
                          topLeft: Radius.circular(32),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                        child: Text(
                          'A man’s sexuality is never your mind responsibility.',
                          style: themeData.textTheme.headline5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 66),
                        child: Text(
                          'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                          style: themeData.textTheme.bodyText2
                              ?.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ]))
              ],
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        themeData.colorScheme.surface,
                        themeData.colorScheme.surface.withOpacity(0)
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
