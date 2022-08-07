import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final String pathImage;
  final double sizeImage;

  const UserProfileImage(
      {Key? key, required this.pathImage, this.sizeImage = 48.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(sizeImage / 2 - sizeImage / 18),
      child: Image.network(
        pathImage,
        fit: BoxFit.cover,
        width: sizeImage,
        height: sizeImage,
      ),
    );
  }
}
