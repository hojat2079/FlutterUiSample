import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/data/data.dart';
import 'package:untitled1/ui/widget/room_card.dart';
import 'package:untitled1/ui/widget/upcoming_rooms.dart';
import 'package:untitled1/ui/widget/user_profile_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.envelope_open,
                color: Colors.black,
                size: 26,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.calendar,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.bell,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {},
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
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 120.0),
                children: [
                  const UpcomingRoom(room: upcomingRoomsList),
                  const SizedBox(
                    height: 12.0,
                  ),
                  ...roomsList.map((e) => RoomCard(
                        room: e,
                      ))
                ]),
            Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.1),
                        Theme.of(context).scaffoldBackgroundColor
                      ])),
                )),
            Positioned(
                bottom: 60,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Start a room',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white),
                      )
                    ],
                  ),
                )),
            Positioned(
                bottom: 70,
                right: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.circle_grid_3x3_fill,
                        size: 28,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                        right: 4.6,
                        bottom: 11.8,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ))
                  ],
                ))
          ],
        ));
  }
}
