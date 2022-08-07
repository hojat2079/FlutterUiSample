import 'package:flutter/material.dart';
import 'package:payment_app/component/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final bool isBorder;
  final Function() onTap;

  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      this.isBorder = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 56,
          width: MediaQuery.of(context).size.width - 60,
          margin: const EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: ColorPalette.mainColor,
              )),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
        ));
  }
}
