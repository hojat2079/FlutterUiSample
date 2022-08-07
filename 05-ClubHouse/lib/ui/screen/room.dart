import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/data/data.dart';
import 'package:untitled1/ui/widget/user_profile_image.dart';
import 'package:untitled1/ui/widget/user_proile_room.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120,
        leading: TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(primary: Colors.black),
            icon: const Icon(CupertinoIcons.chevron_down),
            label: const Text('All rooms')),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.doc,
              color: Colors.black,
            ),
            iconSize: 28,
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 20, 10),
              child: UserProfileImage(
                pathImage: currentUser.imageUrl,
                sizeImage: 36.0,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                            fontSize: 14.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Icon(CupertinoIcons.ellipsis)
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                children: [
                  ...room.speakers.map((e) => UserProfileRoom(
                        pathImage: e.imageUrl,
                        name: e.givenName,
                        size: 66.0,
                        isMuted: Random().nextBool(),
                        isNew: Random().nextBool(),
                      ))
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Followed by speakers',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey[400]),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                children: [
                  ...room.followedBySpeakers.map((e) => UserProfileRoom(
                        pathImage: e.imageUrl,
                        name: e.givenName,
                        size: 66.0,
                        isMuted: false,
                        isNew: Random().nextBool(),
                      ))
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Others in room',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey[400]),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                children: [
                  ...room.others.map((e) => UserProfileRoom(
                        pathImage: e.imageUrl,
                        name: e.givenName,
                        size: 66.0,
                        isMuted: false,
                        isNew: Random().nextBool(),
                      ))
                ],
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 100))
          ],
        ),
      ),
      bottomSheet: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Text.rich(TextSpan(children: [
                  TextSpan(text: '✌🏾', style: TextStyle(fontSize: 20)),
                  TextSpan(
                    text: 'Leave quietly',
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  )
                ])),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.add,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.hand_raised,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
