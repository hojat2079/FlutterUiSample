import 'package:flutter/material.dart';
import 'package:untitled1/data/data.dart';
import 'package:untitled1/ui/colors.dart';

class UpcomingRoom extends StatelessWidget {
  final List<Room> room;

  const UpcomingRoom({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.secondaryBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 32, top: 4, bottom: 4),
        child: Column(
          children: [
            ...room.map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.time),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (e.club.isNotEmpty)
                              Flexible(
                                child: Text(
                                  '${e.club} 🏠'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            Flexible(
                                child: Text(
                              e.name,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
