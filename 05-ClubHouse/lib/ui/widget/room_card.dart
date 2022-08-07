import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/data/data.dart';
import 'package:untitled1/ui/screen/room.dart';
import 'package:untitled1/ui/widget/user_profile_image.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RoomScreen(
                        room: room,
                      )));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                      fontSize: 12.0),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 20,
                                left: 28,
                                child: UserProfileImage(
                                  pathImage: room.speakers[1].imageUrl,
                                )),
                            UserProfileImage(
                                pathImage: room.speakers[0].imageUrl),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => Padding(
                                  padding:
                                      const EdgeInsets.only(top: 1, bottom: 1),
                                  child: Text(
                                    '${e.givenName} ${e.familyName}  💬',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 16),
                                  ),
                                )),
                            const SizedBox(
                              height: 4,
                            ),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text:
                                        '${room.speakers.length + room.followedBySpeakers.length + room.others.length} '),
                                const WidgetSpan(
                                    child: Icon(
                                  CupertinoIcons.person_fill,
                                  color: Colors.grey,
                                  size: 16,
                                )),
                                TextSpan(text: ' / ${room.speakers.length} '),
                                const WidgetSpan(
                                    child: Icon(
                                  CupertinoIcons.chat_bubble_fill,
                                  color: Colors.grey,
                                  size: 16,
                                )),
                              ]),
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
