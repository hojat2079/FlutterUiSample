import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/utils/style.dart';

class IconTextView extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconTextView({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xffbfc2df),
          ),
          const Gap(10),
          Text(
            text,
            style: Style.defaultTextStyle,
          ),
        ],
      ),
    );
  }
}
