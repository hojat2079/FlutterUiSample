import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewArticlePage extends StatefulWidget {
  const NewArticlePage({Key? key}) : super(key: key);

  @override
  State<NewArticlePage> createState() => _NewArticlePageState();
}

class _NewArticlePageState extends State<NewArticlePage> {
  final TextEditingController _titleController = TextEditingController(
    text: 'The art of begin an artist',
  );
  final TextEditingController _subTitleController =
      TextEditingController(text: 'Simplified products');
  final TextEditingController _descController = TextEditingController(
      text:
          'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny.');

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // pinned: true,
                // floating: true,
                backgroundColor: themeData.colorScheme.surface,
                title: Text(
                  'New Article',
                  style: themeData.textTheme.headline4,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/img/icons/download.svg'),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 32,
                        left: 32,
                        top: 36,
                        bottom: 100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            style: themeData.textTheme.headline4!.copyWith(
                              fontSize: 22,
                            ),
                            controller: _titleController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xff7B8BB2).withOpacity(0.26),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: themeData.colorScheme.primary,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: TextField(
                              style: themeData.textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xff7B8BB2)
                                        .withOpacity(0.26),
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: themeData.colorScheme.primary,
                                    width: 2,
                                  ),
                                ),
                              ),
                              controller: _subTitleController,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Wrap(
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runSpacing: 8,
                            spacing: 8,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  'Add Tags',
                                  style:
                                      themeData.textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: themeData.colorScheme.primary,
                                  ),
                                ),
                              ),
                              const SizedBox.shrink(),
                              _chipWidget(themeData, 'Art'),
                              _chipWidget(themeData, 'Design'),
                              _chipWidget(themeData, 'Culture'),
                              _chipWidget(themeData, 'Production'),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            'Article Content',
                            style: themeData.textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 2.2,
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff7B8BB2).withOpacity(0.26),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          TextField(
                            style: themeData.textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                            ),
                            controller: _descController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            maxLines: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 40,
            right: 0,
            left: 0,
            child: Container(
              height: 48,
              margin: const EdgeInsets.symmetric(horizontal: 56),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: const Color(0xff0D253C),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 13,
                      offset: const Offset(0, 13)),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset('assets/img/icons/close.svg'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset('assets/img/icons/image.svg'),
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset('assets/img/icons/play.svg'),
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset('assets/img/icons/align.svg'),
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset('assets/img/icons/link.svg'),
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset('assets/img/icons/scale.svg'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _chipWidget(ThemeData themeData, String label) {
    return UnconstrainedBox(
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75),
          border: Border.all(
            color: themeData.colorScheme.primary,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 16,
            ),
            Text(
              label,
              style: themeData.textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 12,
                color: themeData.colorScheme.primary,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(4),
              margin:
                  const EdgeInsets.only(left: 8, top: 2, bottom: 2, right: 2),
              decoration: BoxDecoration(
                color: const Color(0xff376AED).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/img/icons/close.svg',
                width: 16,
                height: 16,
                color: themeData.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
