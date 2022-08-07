import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/widget/user_profile_image.dart';

class UserProfileRoom extends StatelessWidget {
  final String pathImage;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const UserProfileRoom(
      {Key? key,
      required this.pathImage,
      required this.name,
      required this.size,
      required this.isNew,
      required this.isMuted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: UserProfileImage(
                sizeImage: size,
                pathImage: pathImage,
              ),
            ),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                  child: const Text(
                    '🎉',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6)
                        ]),
                    child: const Icon(
                      CupertinoIcons.mic_slash_fill,
                    )),
              )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
