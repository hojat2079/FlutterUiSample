import 'package:advance_ui_sevenlearn/data.dart';
import 'package:advance_ui_sevenlearn/gen/assets.gen.dart';
import 'package:advance_ui_sevenlearn/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppData.posts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.background.withOpacity(0),
        titleTextStyle: themeData.textTheme.headline4,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_rounded),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(32, 8, 32, 64),
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color:
                                themeData.colorScheme.primary.withOpacity(0.1),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 84,
                                  height: 84,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: const LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xFF376AED),
                                        Color(0xFF49B0E2),
                                        Color(0xFF9CECFB),
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(2),
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: themeData.colorScheme.surface,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child:
                                            Assets.img.stories.story8.image()),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '@joviedan',
                                          style: themeData.textTheme.bodyText1
                                              ?.copyWith(
                                                  color: themeData
                                                      .colorScheme.onSecondary,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Jovi Daniel',
                                          style: themeData.textTheme.subtitle1
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w800,
                                                  color: themeData
                                                      .colorScheme.onSurface),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'UX Designer',
                                          style: themeData.textTheme.bodyText1
                                              ?.copyWith(
                                                  color: themeData
                                                      .colorScheme.primary,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'About me',
                              style: themeData.textTheme.subtitle1?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: themeData.colorScheme.onSurface),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                              style: themeData.textTheme.bodyText1?.copyWith(
                                  color: themeData.colorScheme.onSecondary,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 32,
                        right: 96,
                        left: 96,
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 30,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.8),
                            )
                          ]),
                        )),
                    Positioned(
                      bottom: 32,
                      left: 64,
                      right: 64,
                      child: Container(
                        height: 68,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: themeData.colorScheme.primary,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFF2151CD),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '52',
                                      style: themeData.textTheme.headline5!
                                          .apply(
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Post',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w200,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '250',
                                    style: themeData.textTheme.headline5!.apply(
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Following',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 13,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5K',
                                    style: themeData.textTheme.headline5!.apply(
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Followers',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w200,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color:
                                themeData.colorScheme.primary.withOpacity(0.1),
                            blurRadius: 20)
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 32,
                          right: 16,
                          top: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'My Post',
                                style: themeData.textTheme.headline5,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Assets.img.icons.grid.svg(),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Assets.img.icons.table.svg(),
                            ),
                          ],
                        ),
                      ),
                      PostListViewBuilder(
                        posts: posts,
                        withShadow: true,
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
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
      ),
    );
  }
}
