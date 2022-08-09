import 'package:flutter/material.dart';
import 'package:ticket_booking/utils/style.dart';

class TwoTextView extends StatelessWidget {
  final String text1;
  final String text2;

  const TwoTextView({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: Style.headLine2TextStyle,
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            primary: Colors.blueGrey,
          ),
          child: Text(
            text2,
            style: Style.defaultTextStyle.apply(color: Colors.blueGrey),
          ),
        )
      ],
    );
  }
}
