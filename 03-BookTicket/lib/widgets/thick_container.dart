import 'package:flutter/material.dart';

class ThickContainer extends StatelessWidget {
  final bool isColor;

  const ThickContainer({Key? key, this.isColor = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isColor ? Colors.white : const Color(0xff8accf7),
          width: 2.5,
        ),
      ),
    );
  }
}
