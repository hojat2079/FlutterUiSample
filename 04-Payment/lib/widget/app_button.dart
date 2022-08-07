import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Color backgroundColor;
  final Color iconColor;
  final Color? textColor;
  final IconData iconData;
  final Function() onTap;

  const AppButton(
      {Key? key,
      this.text,
      required this.backgroundColor,
      required this.iconColor,
      this.textColor,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: Icon(
              iconData,
              size: 30,
              color: iconColor,
            ),
          ),
          if (text != null)
            Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  text!,
                  style: TextStyle(color: textColor, fontSize: 14),
                ),
              ],
            )
        ],
      ),
    );
  }
}
